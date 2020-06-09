function [U_global,Y_modelu_global] = DMC_sim(N, Nu, D, Yzad_vec, A, Psi, s, a, b)
%UNTITLED Summary of this function goes 
%   Detailed explanation goes here
% d?ugo?? Yzad_vec determinuje ile iteracji algorytmu si? wykona
n_iter = size(Yzad_vec, 1);
U=zeros(1,D);
Y_modelu = [0 0];
Y_modelu_global = zeros(n_iter,1);
U_global = zeros(n_iter, 1);

S = zeros(N+D-1, 1);
for i=1:N+D-1
    if(i>D)
        S(i)=s(D);
    else
        S(i) = s(i);
    end
end

Mp = zeros(N, D-1);
for n=1:N
    for d=1:D-1
        Mp(n,d) = S(n+d)-S(d);
    end
end

M = zeros(N,Nu);
for n=1:N
    for nu=1:Nu
        if(nu>n)
            M(n,nu)=0;
        else
           M(n,nu)=S(n-nu+1); 
        end
    end
end

%K = inv(M'*Psi*M + A)*M'*Psi;
K = (M'*Psi*M + A)\(M'*Psi);

for k=1:n_iter
    Yzad=Yzad_vec(k);
    %Yk = aktualne wyj?cie modelu wyznaczone z rownania roznicowego
    Yk = b(1:2)*(U(1:2)') - a(1:2)*(Y_modelu(1:2)');
    Y_modelu_global(k)=Yk;
    Y_modelu=push_front(Y_modelu, Yk);
    %DMC_out liczy ka?dy parametr za ka?d? iteracj?, co jest niepotrzebne,
    %ale wygodne. np. K, M i Mp jest sta?e i mo?e by? liczone tylko raz
    Uk = DMC_out(Yzad, U, Yk, N, D, Mp, K);
    U_global(k) = Uk;
    U = push_front(U, Uk);
end

end


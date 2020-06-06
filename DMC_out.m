function [Uk] = DMC_out(Yzad, U, A, Psi, Yk, s, N, Nu, D)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%Yzad - wektor N*1
%U -  wektor D*1
%A - wektor Nu*Nu
%Psi - wektor N*N
%Yk - wektor N*1, aktualne wyj?cie modelu
%s - wektor D*1 odpowiedzi skokowych 
%N - horyzont predykcji
%Nu - horyzont sterowania
%D - horyzont dynamiki objektu

Yzad = ones(N,1).*Yzad;
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

deltaUp = zeros(D-1, 1);
for i=1:D-1
    deltaUp(i) = U(i)-U(i+1);
end

%K = inv(M'*Psi*M + A)*M'*Psi;
K = (M'*Psi*M + A)\(M'*Psi);

deltaU_opt = K*(Yzad - Yk - Mp*deltaUp);
Uk = U(1)+deltaU_opt(1);
end


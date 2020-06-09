function [Uk] = DMC_out(Yzad, U, Yk, N, D, Mp, K)
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


deltaUp = zeros(D-1, 1);
for i=1:D-1
    deltaUp(i) = U(i)-U(i+1);
end


deltaU_opt = K*(Yzad - Yk - Mp*deltaUp);
Uk = U(1)+deltaU_opt(1);
end


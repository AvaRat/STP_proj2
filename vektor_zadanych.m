function [yzad] = vektor_zadanych(n_probek)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%generacja vektora warto?ci zadanych 
yzad = zeros(n_probek, 1);
values = [0, 2, -2, 2, 2];
v = int32(n_probek/5);
changes = [v, 2*v, 3*v, 4*v];
iter = 1;
for i=1:n_probek
   logi = find(changes==i);
   if(any(logi))
       iter=iter+1;
   end
   yzad(i)=values(iter);
end
end


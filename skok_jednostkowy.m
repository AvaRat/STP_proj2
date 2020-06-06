function [out] = skok_jednostkowy(n_probek)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
out = linspace(0,10, n_probek);
out(out<=2)=0;
out(out>2)=1;
out=out';
end


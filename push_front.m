function [vector_out] = push_front(vector, value)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    vector_out=[value, vector];
    vector_out(end)=[];
end


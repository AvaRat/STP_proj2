function [s,all_left, all_right] = get_s(a, b, num_s)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
s = zeros(num_s,1);
all_left = zeros(size(s));
all_right = zeros(size(s));
for n=1:num_s
    left = 0;
    for i=1:min(n,3)
        left = left + b(i);
    end
    right = 0;
    for i=1:min(n-1, 2)
        right = right + a(i)*s(n-i);
    end
    all_left(n)=left;
    all_right(n)=right;
    s(n) = left-right;
end

end


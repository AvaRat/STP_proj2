function [y_k, u_k] = PID_out(Gz, prev_y, prev_u)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    y_k = -d(2)*y(k-1) -d(3)*y(k-2) + n(1)*u(k-delay) + n(2)*u(k-delay-1) +n(3) * u(k-delay-2);
    e_k = yzad(k) - y(k);
    u_k = r2*e(k-2) + r1*e(k-1) +r0*e(k) + u(k-1);
end


function [y,u,T] = PID_sim(B,simtime,r0,r1,r2)
[n d] = tfdata(B);
n = n{1};
d = d{1};
delay = 10;
T = 0:0.5:simtime;
y(1:13) = 0;
u(1:13) = 0;
e(1:13) = 0;
yzad(1:20) = 0;
yzad(20:20+length(T)-1) = 1;
for k=13:20+length(T)-1
    y(k) = -d(2)*y(k-1) -d(3)*y(k-2) + n(1)*u(k-delay) + n(2)*u(k-delay-1) +n(3) * u(k-delay-2);
    e(k) = yzad(k) - y(k);
    u(k) = r2*e(k-2) + r1*e(k-1) +r0*e(k) + u(k-1);
   
end
y = y(20:end);
length(y);
%stairs(T,y);




end


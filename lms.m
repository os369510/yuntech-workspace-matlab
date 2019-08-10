function [h,y]=lms(x,d,delta,N)
M=length(x);y=zeros(1,M);
h=zeros(1,N);
for n=N:M
    x1=x(n:-1:n-N+1);
    y=h*x1';
    e=d(n)-y;
    h=h+delta*e*x1;
end
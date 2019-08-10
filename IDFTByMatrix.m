function [xn]=IDFTByMatrix(Xk,N)
L=length(Xk);
Wnk=zeros(N,L);
for y=1:1:N
    for x=1:1:L
        Wnk(y,x)=exp(j*2*pi*(x-1)*(y-1)/N);
    end
end
Xk=Xk';
xn=Wnk*Xk/N;
xn=xn';
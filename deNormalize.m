function [b,a]=deNormalize(Z,P,K,Wc,N);
p=P*Wc;
k=K*(Wc^N);
b_temp=real(poly(Z));
b=k*b_temp
a=real(poly(p));
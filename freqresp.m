function [H]=freqresp(b,a,w)
M=length(b);
N=length(a);
L=length(w);
H=zeros(1,L);

for i=1:1:L  
    B=0;A=0;
    for m=0:1:M-1
        B=B+b(m+1)*exp(j*w(i)*m);
    end
    
    for l=1:1:N-1
        A=A+a(l+1)*exp(-j*w(i)*l);
    end
    H(i)=B/(1+A);
end
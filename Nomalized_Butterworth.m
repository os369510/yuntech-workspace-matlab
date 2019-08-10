function [S_left]=Nomalized_Butterworth(N);
k=(0:1:2*N-1);
S=zeros(1,k);
if(mod(N,2)==1)
    S=exp(j*pi.*k/N);
end
if(mod(N,2)==0)
    S=exp(j*pi.*((2.*k)+1)/(2*N));
end
S_left=S((N/2)+1:1:(N/2)+N);
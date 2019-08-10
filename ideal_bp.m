function [hd]=ideal_bp(wc1,wc2,N)
%////////////////////////////////
%input:
%wc=(wp+ws)/2
%N=nd length
%
%output:
%hd:impules response
%////////////////////////////////
N_middle=(N+1)/2;
hd=zeros(1,N);
for i=1:1:N
    if (i~=N_middle+1)
        hd(i)=sin((i-N_middle-1)*wc2)/((i-N_middle-1)*pi) - sin((i-N_middle-1)*wc1)/((i-N_middle-1)*pi);
    end
    if (i==N_middle+1)
        hd(i)=2*((wc2-wc1)/(2*pi));
    end
end
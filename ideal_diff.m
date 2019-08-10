function [hd]=ideal_diff(N)
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
        hd(i)=(cos(pi*(i-1-N_middle))/(i-1-N_middle)) - (sin(pi*(i-N_middle-1))/(pi*(i-N_middle-1)^2));
    end
    if (i==N_middle+1)
        hd(i)=0;
    end
end
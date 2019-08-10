function xn=FFT_su(x,N);
%//////////////////////////////////////////////////////
%Input:
%x is Data
%N is Data's length
%
%Return:
%xn is fast fourier transform on x
%//////////////////////////////////////////////////////
for i=1:1:16
    if (2^i)>=N 
        break;
    end
end
n=2^i;
if length(x)<=N
    x=[x zeros(1,n-length(x))];
    xn=[x zeros(1,n-length(x))];
end
xx=zeros(1,N);
if length(x)>N
    for u=1:1:N
        xx(u)=x(u);
    end
    x=zeros(1,n);
    for uu=1:1:N
        x(uu)=xx(uu);
    end
    xn=x;
end
for i1=1:1:n   %change x place
    bnew=0;
    for ib=1:1:i  %compute x place
        bnew=bnew + (bitget(i1-1,ib))*(2^(i-ib));
    end
    xn(bnew+1)=x(i1);
end
a=0;b=0;
Wn=exp(-j*2*pi/n);
for k1=1:1:i
    cou=0;
    for k11=1:1:n/(2^k1)  %point DFT
        cou=cou+2^(k1-1);
        for k111=1:1:2^(k1-1)
            cou=cou+1;
            xn(cou)=xn(cou)*(Wn^ ( 0+ (k111-1)*(2^(i-k1)) ));
        end
    end
    for k2=1:2^k1:n  %point-to-point sum
        for k3=1:1:2^(k1-1)  
            a= xn(k2+(k3-1)) + xn(k2+(k3-1)+(2^(k1-1))) ;
            b = -1*xn(k2+(k3-1)+(2^(k1-1))) + xn(k2+(k3-1));
            xn(k2+(k3-1))=a;
            xn(k2+(k3-1)+(2^(k1-1)))=b;
        end
    end
end

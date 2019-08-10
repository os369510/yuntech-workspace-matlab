function [y]=rongfft(AA,N)
y=zeros(1,N); 
yy=zeros(1,N); 
p=log2(N); 
z=exp(-2*pi*i/N); 
w=zeros(1,N/2); 
for k=1:N
y(k)=AA(k);     % 外部需要變換的序列
end
for k=1:N/2
   w(k)=z^(k-1);   % twiddle factor
end
for q=1:p
   for n=0:2^(p-q)-1
       for k=0:2^(q-1)-1
u=y(2^(q-1)*n+k+1); 
v=y(2^(q-1)*n+2^(p-1)+k+1); 
yy(2^q*n+k+1)=(u+v); 
yy(2^q*n+k+2^(q-1)+1)=(u-v)*w(n*2^(q-1)+1);
       end
   end
for j=1:N
   y(j)=yy(j);  % output
end
end

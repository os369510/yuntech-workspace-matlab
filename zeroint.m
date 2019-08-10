function out=zeroint(a)
[m,n]=size(a);
a2=reshape([a;zeros(m,n)],m,2*n);
out=reshape([a2';zeros(2*n,m)],2*n,2*m);


function k=daoxu(k,m)
Y=zeros(1,m);
for i=1:m
   Y(m-i+1)=mod(k,2);
   k=fix(k/2);
end
Y=Y(end:-1:1);
kk=Y(m);
for i=1:m-1
   if Y(i)~=0
       kk=kk+2^(m-i);
   end
end
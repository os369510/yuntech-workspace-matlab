function [y,index2] = dnsample1(x,M,index)
mysize = size(x);
j=0;
for i = index : M : mysize(2)%n=0?H?W
    y(index+j) = x(i);
    j=j+1;
end
 
j=0;
myindex = 0;
for i = index : -M : 1%n=0?H?U
    y(index-j) = x(i);
    myindex = index-j;
    j=j+1;
end
 
n = 0;
for i = 1:myindex
    if y(1)==0 
       y(1)=[];
       n=n+1;
    end
end
index2 = index-n;

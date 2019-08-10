close all;clear all;clc;
n1=-1;n2=10;
N=n2-n1+1;
x=zeros(1,N);
x=[3,-1,2,5,2.4,0,6];
y=zeros(1,N);
for n=1:1:7
k=impseq(n,n1,n2);
y=y+x(n).*k;
end
stem(y);
title('Question1-(c)');
xlabel('sample');
ylabel('value');
axis([-1 10 -5 10])
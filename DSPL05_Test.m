close all;clear all;clc;

x=[1,2,3,4,5,6,7,8,9,10,11];
[y,index]=dnsample(x,3,5);
for i=1:1:101
    w1(i)=i-51;
end
for i=1:1:101
    w2(i)=i-13;
end

figure('Name','Problem1(b)');
for i=1:1:101
   x(i)=sin(0.125*pi*(i-51));
end
[y,index]=dnsample(x,4,21);
subplot(2,1,1),stem(w1,x),axis('tight'), xlabel('n'), ylabel('value'),title('x[n]')
subplot(2,1,2),stem(w2,y),axis('tight'), xlabel('n'), ylabel('value'),title('y[n]')
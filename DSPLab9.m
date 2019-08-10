close all;clear all;clc;
%n=-100:100;
% x=(-0.9).^n;
% y=DTFT(x,length(x));
%plot(abs(y))

N=[4000 1000 8000];
f=4000;
t=0:1/f:0.1;
x=cos(800*pi*t)-sin(1200*pi*t)+sin(808*pi*t);
y1=DTFT(x,N(1));
y2=DTFT(x,N(2));
y3=DTFT(x,N(3));
figure;plot(abs(y1));
figure;plot(abs(y2));
figure;plot(abs(y3));
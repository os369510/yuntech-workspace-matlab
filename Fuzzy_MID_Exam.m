close all;clear all;clc;
x=linspace(-1,5,3000);
y=3.*x.*x-6.*x+exp(x);
% x=linspace(-180,180,1000);
% y=10*sin(x*pi/180);
plot(x,y);
axis ([-1 5 -1 10]);
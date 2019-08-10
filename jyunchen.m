close all;clear all;clc;
Kp=200;
Ki=10;
Kd=0
num=[10*Kd 10*Kp 10*Ki];
den=[(2*pi*10^3)^-2 (4*pi*10^3)^-1+10*Kd 1+10*Kp 10*Ki];

h=tf(num,den);
t=0:0.00002:4*10^-3;
step(h,t);
S = stepinfo(h)
[Gm,Pm,Wcg,Wcp]=margin(h)
w=logspace(-2,7,100000);
%subplot(211);
bode(num,den,w);
grid;
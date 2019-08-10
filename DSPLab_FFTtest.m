close all;clc;clear all;
Fs=2345;
t=0:1/Fs:1;
x=0.5*sin(2*pi*200*t)+1.5*cos(2*pi*500*t)-0.3*cos(2*pi*300*t);
tic
%y=abs(fft(x));
y=abs(Fast_Fourier_Transform(x));
time=toc
w=linspace(0,Fs,length(y));
plot(w,y);
close all; clear all; clc;
fs=100;
t=[0:1/fs:0.1];
x=cos(5*pi*t);
N=128;
f1=fft(x,N);
f2=DIF_FFT(x,N);
subplot(2,1,1)
plot(abs(fft(x,N)));
xlabel('f')	
ylabel('value')
axis tight
title(['fft(x)'])
subplot(2,1,2)
plot(abs(DIF_FFT(x,N)));
xlabel('f')
ylabel('value')
axis tight
title(['fft(x)'])

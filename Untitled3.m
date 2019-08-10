close all;clear all;clc;
%setup
[y,fs]=wavread('welcome.wav'); %read file
time=(1:length(y))/fs;
w=linspace(0,2*pi,length(y));
noise=.4*sin(1000*2*pi*time);
Hy=abs(fft(y));
Hny=abs(fft(y'+noise));
%compute
%print
sound(y'+noise,fs);
subplot(1,2,1);
plot(w/pi,Hy);
title('.wav in frquency domain');xlabel('Omega/pi');ylabel('value');axis ([0 2 0 max(Hny)]);
subplot(1,2,2);
plot(w/pi,Hny);
title('noise in frquency domain');xlabel('Omega/pi');ylabel('value');axis tight;

close all;clear all;clc;
vin=10;
f=0:0.001:1;
omc=1./(2*pi.*f*10e-6);
vout=omc./(omc+1e6);
subplot(1,2,1);
plot(f,vout);
subplot(1,2,2);
plot(abs(fft(vout)))
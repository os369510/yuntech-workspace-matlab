close all;clear all;clc;
n=24000;
M=mod(linspace(0,360*16,n),360);
N=mod(linspace(0,360*15,n),360);
S=mod(linspace(0,360*12,n),360);
MN=M-N;
MS=M-S;
subplot(2,2,1);
plot(M);
axis tight;
subplot(2,2,2);
plot(N);
axis tight;
subplot(2,2,3);
plot(S);
axis tight;
subplot(2,2,4);
plot(mod(MN,360));
axis tight;
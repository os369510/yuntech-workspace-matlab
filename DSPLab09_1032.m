close all;clear all;clc;
%% Question 1
figure('Name','Question 1');
%% Define
w1s=0.1*pi; w1p=0.25*pi;
w2s=0.7*pi; w2p=0.55*pi;
As=60; Rp=1;
%% Compute
deltaF=w1p-w1s;
deltaP=(10^(Rp/20)-1)/(10^(Rp/20)+1);
deltaS=(1+deltaP)/(10^(As/20))
[M,fo,ao,W]=firpmord([w1s,w1p,w2p,w2s]/pi,[0,1,0],[deltaS,deltaP,deltaS]);
M
newM=M+30;
N=orderFromAlgorithm(deltaP,deltaS,deltaF)
[h,delta] = firpm(newM,fo,ao,W);
w4h=-(length(h)-1)/2:(length(h)-1)/2;
delta
H=db(fft(h,1024));
w4H=linspace(0,2*pi,length(H));
%% Plot
subplot(1,2,1);
stem(w4h,h),xlabel('n');title(['ori. order=',int2str(M),',order=',int2str(newM),',order of algorithm=',int2str(N),',impulse response']);axis tight;
subplot(1,2,2);
plot(w4H/pi,H);xlabel('\omega/\pi');title('magnitude response');grid on;axis tight;

clear all;clc;
%% Question 2
figure('Name','Question 2');
%% Define
Fs=15000;
w1s=(900-450)*2*pi/Fs; w1p=900*2*pi/Fs;
w2s=(1100+450)*2*pi/Fs; w2p=1100*2*pi/Fs;
As=30; Rp=0.87;
%% Compute
deltaF=w1p-w1s;
deltaP=(10^(Rp/20)-1)/(10^(Rp/20)+1);
deltaS=(1+deltaP)/(10^(As/20))
[M,fo,ao,W]=firpmord([w1s,w1p,w2p,w2s]/pi,[0,1,0],[deltaS,deltaP,deltaS]);
M
newM=M+19;
N=orderFromAlgorithm(deltaP,deltaS,deltaF)
[h,delta] = firpm(newM,fo,ao,W);
w4h=-(length(h)-1)/2:(length(h)-1)/2;
delta
H=db(fft(h,1024));
w4H=linspace(0,2*pi,length(H));
%% Plot
subplot(1,2,1);
stem(w4h,h),xlabel('n');title(['ori. order=',int2str(M),',order=',int2str(newM),',order of algorithm=',int2str(N),',impulse response']);axis tight;
subplot(1,2,2);
plot(w4H/pi,H);xlabel('\omega/\pi');title('magnitude response');grid on;axis tight;

clear all;clc;
%% Question 3
figure('Name','Question 3');
%% Define
Fs=8000;
wp=1500*2*pi/Fs;ws=(1500+500)*2*pi/Fs;
As=50; Rp=0.1;
%% Compute
deltaF=500*2*pi/Fs;
deltaP=(10^(Rp/20)-1)/(10^(Rp/20)+1)
deltaS=(1+deltaP)/(10^(As/20));
[M,fo,ao,W]=firpmord([wp,ws]/pi,[1,0],[deltaP,deltaS]);
M
newM=M+2;
N=orderFromAlgorithm(deltaP,deltaS,deltaF)
[h,delta] = firpm(newM,fo,ao,W);
w4h=-(length(h)-1)/2:(length(h)-1)/2;
delta
H=db(fft(h,1024));
w4H=linspace(0,2*pi,length(H));
%% Plot
subplot(1,2,1);
stem(w4h,h),xlabel('n');title(['ori. order=',int2str(M),',order=',int2str(newM),',order of algorithm=',int2str(N),',impulse response']);axis tight;
subplot(1,2,2);
plot(w4H/pi,H);xlabel('\omega/\pi');title('magnitude response');grid on;axis tight;

clear all;clc;
%% Question 4
figure('Name','Question 4');
%% Define
ws=0.5*pi;wp=0.65*pi;
As=50; Rp=0.5;
%% Compute
deltaF=wp-ws;
deltaP=(10^(Rp/20)-1)/(10^(Rp/20)+1);
deltaS=(1+deltaP)/(10^(As/20))
[M,fo,ao,W]=firpmord([ws,wp]/pi,[0,1],[deltaS,deltaP]);
M
newM=M+18;
N=orderFromAlgorithm(deltaP,deltaS,deltaF)
[h,delta] = firpm(newM,fo,ao,W);
w4h=-(length(h)-1)/2:(length(h)-1)/2;
delta
H=db(fft(h,1024));
w4H=linspace(0,2*pi,length(H));
%% Plot
subplot(1,2,1);
stem(w4h,h),xlabel('n');title(['ori. order=',int2str(M),',order=',int2str(newM),',order of algorithm=',int2str(N),',impulse response']);axis tight;
subplot(1,2,2);
plot(w4H/pi,H);xlabel('\omega/\pi');title('magnitude response');grid on;axis tight;

clear all;clc;
%% Question 5
figure('Name','Question 5');
%% Define
w1p=0.1*pi; w1s=0.25*pi;
w2s=0.55*pi; w2p=0.7*pi;
As=60; Rp=1;
%% Compute
deltaF=w2p-w2s;
deltaP=(10^(Rp/20)-1)/(10^(Rp/20)+1)
deltaS=(1+deltaP)/(10^(As/20));
[M,fo,ao,W]=firpmord([w1p,w1s,w2s,w2p]/pi,[1,0,1],[deltaP,deltaS,deltaP]);
M
newM=M+2;
N=orderFromAlgorithm(deltaP,deltaS,deltaF)
[h,delta] = firpm(newM,fo,ao,W);
w4h=-(length(h)-1)/2:(length(h)-1)/2;
delta
H=db(fft(h,1024));
w4H=linspace(0,2*pi,length(H));
%% Plot
subplot(1,2,1);
stem(w4h,h),xlabel('n');title(['ori. order=',int2str(M),',order=',int2str(newM),',order of algorithm=',int2str(N),',impulse response']);axis tight;
subplot(1,2,2);
plot(w4H/pi,H);xlabel('\omega/\pi');title('magnitude response');grid on;axis tight;
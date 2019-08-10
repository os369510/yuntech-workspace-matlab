close all;clear all;clc;
%% Question 1
figure('Name','Question 1');
%% Define
Wp=200*pi; Rp=2;
Ws=300*pi; As=40;
Fs=600/2;
f=linspace(0,Fs,1024);
w=f*2*pi;
%% Compute
[b,a,Wc]=afd_butt(Wp,Ws,Rp,As,'stopband');
Hs=freqs(b,a,w);
[b,a]=afd_butt(Wp,Ws,Rp,As,'passband');
Hp=freqs(b,a,w);
%% Plot
subplot(2,1,1);
plot(f,db(abs(Hs)));axis tight;title('edge frequency = stopband');xlabel('Frequency');ylabel('Magnitude(dB)');
subplot(2,1,2);
plot(f,db(abs(Hp)));axis tight;title('edge frequency = passband');xlabel('Frequency');ylabel('Magnitude(dB)');

%% Question 2
figure('Name','Question 2');
%% Define
fp=1500; delta_f=500; Rp=0.1; As=50; Fs=8000;
fs=fp+delta_f;
f=linspace(0,Fs/2,4096);
w=f*2*pi;
%% Compute
Wp=2*pi*fp;
Ws=2*pi*fs;
[b,a]=afd_butt(Wp,Ws,Rp,As,'passband');
Hp=freqs(b,a,w);
%% Plot
subplot(2,1,1);
plot(f,db(abs(Hp)));axis tight;title('edge frequency = passband');xlabel('Frequency');ylabel('Magnitude(dB)');
%% Define
wp=0.2*pi; Rp=1;
ws=0.3*pi; As=15; T=0.1
%% Compute
Wp=wp/T;
Ws=ws/T;
f=linspace(0,5,4096);
w=2*pi*f;
[b,a]=afd_butt(Wp,Ws,Rp,As,'stopband');
Hs=freqs(b,a,w);
%% Plot
subplot(2,1,2);
plot(f,db(abs(Hs)));axis tight;title('edge frequency = stopband');xlabel('Frequency');ylabel('Magnitude(dB)');
close all;clear all;clc;
%% Question 1
figure('Name','Question 1');
%% Def.
OmgP = 0.2*pi;
OmgS = 0.3*pi;
Rp=0.25;As=50;
M1=67;
M2=111;
%% Compute
OmgC=(OmgP+OmgS)/2;
a1=(M1+1)/2;
a2=(M2+1)/2;
n1=1:M1;
n2=1:M2;
hd1=sin(OmgC*(n1-a1+eps))./(pi*(n1-a1+eps));
hd2=sin(OmgC*(n2-a2+eps))./(pi*(n2-a2+eps));
hamming=0.54-0.46*cos(2*pi.*n1/(M1-1));
blackman=0.42-0.5*cos((2*pi.*n2)/(M2-1))+0.08*cos((4*pi.*n2)/(M2-1));
hh=hamming.*hd1;
hb=blackman.*hd2;
Hh=20*log10(abs(fft(hh,2048)));
Hb=20*log10(abs(fft(hb,2048)));
Hh=Hh(1:1024);
Hb=Hb(1:1024);
%% Plot
subplot(2,3,1);
stem(hd1);axis tight;xlabel('n');ylabel('value');title('ideal LPF sequence');
subplot(2,3,2);
stem(hamming);axis tight;xlabel('n');ylabel('value');title('hamming window');
subplot(2,3,3);
plot(Hh);axis tight;xlabel('omega');ylabel('magnitude');title('ideal LPF');
subplot(2,3,4);
stem(hd2);axis tight;xlabel('n');ylabel('value');title('ideal LPF sequence');
subplot(2,3,5);
stem(blackman);axis tight;xlabel('n');ylabel('value');title('blackman window');
subplot(2,3,6);
plot(Hb);axis tight;xlabel('omega');ylabel('magnitude');title('ideal LPF');

clear all;
%% Question 2
figure('Name','Question 2');
%% Define
Omg1s=0.2*pi;
Omg1p=0.35*pi;
Omg2p=0.65*pi;
Omg2s=0.8*pi;
As=50;
Rp=1;
M1=45;
M2=75;
%% Compute
OmgC1=(Omg1p+Omg1s)/2;
OmgC2=(Omg2p+Omg2s)/2;
a1=(M1+1)/2;
a2=(M2+1)/2;
n1=1:M1;
n2=1:M2;
hd11=sin(OmgC1*(n1-a1+eps))./(pi*(n1-a1+eps));
hd12=sin(OmgC2*(n1-a1+eps))./(pi*(n1-a1+eps));
hd21=sin(OmgC1*(n2-a2+eps))./(pi*(n2-a2+eps));
hd22=sin(OmgC2*(n2-a2+eps))./(pi*(n2-a2+eps));
hd1=hd12-hd11;
hd2=hd22-hd21;
hamming=0.54-0.46*cos(2*pi.*n1/(M1-1));
blackman=0.42-0.5*cos((2*pi.*n2)/(M2-1))+0.08*cos((4*pi.*n2)/(M2-1));
hh=hamming.*hd1;
hb=blackman.*hd2;
Hh=20*log10(abs(fft(hh,2048)));
Hb=20*log10(abs(fft(hb,2048)));
Hh=Hh(1:1024);
Hb=Hb(1:1024);
%% Plot
subplot(2,3,1);
stem(hd1);axis tight;xlabel('n');ylabel('value');title('ideal BPF sequence');
subplot(2,3,2);
stem(hamming);axis tight;xlabel('n');ylabel('value');title('hamming window');
subplot(2,3,3);
plot(Hh);axis tight;xlabel('omega');ylabel('magnitude');title('ideal BPF');
subplot(2,3,4);
stem(hd2);axis tight;xlabel('n');ylabel('value');title('ideal BPF sequence');
subplot(2,3,5);
stem(blackman);axis tight;xlabel('n');ylabel('value');title('blackman window');
subplot(2,3,6);
plot(Hb);axis tight;xlabel('omega');ylabel('magnitude');title('ideal BPF');

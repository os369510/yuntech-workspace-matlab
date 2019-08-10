close all;clear all;clc;
%setup
%/sound
[y,fs]=wavread('welcome.wav'); %read file
time=(1:length(y))/fs;
w=linspace(0,2*pi,length(y));
noise=.4*sin(1000*2*pi*time);
%/ideal-bs
fp1=800;fs1=900;fs2=1100;fp2=1200;Rp=1;As=50;
%compute
%/ideal-bs
Wp1=2*pi*[fp1,fp2]/fs;Ws1=2*pi*[fs1,fs2]/fs;
[N_length,OmegaC]=ellipord(Wp1,Ws1,Rp,As);
[Hs_b,Hs_a]=ellip(N_length,Rp,As,OmegaC);
[H]=freqz(Hs_b,Hs_a,length(y));
h=ifft(H,length(y));
wH=linspace(0,fs,length(y));
End=conv((y'+noise),abs(h));
Hend=abs(fft(End,length(y)));
%print
subplot(3,1,1);
plot(wH,H);
title('ideal-bs filter in Freq. domain');xlabel('freq.');ylabel('value');axis ([0 1200 0 max(H)]);
subplot(3,1,2);
plot(wH,Hny);
title('noise in frquency domain');xlabel('freq.');ylabel('value');axis ([0 1200 0 max(Hny)]);
subplot(3,1,3);
plot(wH,Hend);
title('filtered sound in frquency domain');xlabel('freq.');ylabel('value');axis ([0 1200 0 max(Hny)]);
%sound(End,fs);
%waveFile='1000Hz_LP.wav';	% ���x�s�� wav �ɮ�
%wavwrite(End, fs, 8, waveFile);
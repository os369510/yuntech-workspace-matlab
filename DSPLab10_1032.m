close all;clear all;clc;
%% Question 1
figure('Name','Question 1 (a)');
%% Define
fm=400;
f2=5000;
maxf=max(fm,f2);
fs=10*maxf;
t=0:1/fs:0.01;
x1=5*sin(2*pi*fm*t);
x2=5*sin(2*pi*fm*t).*sin(2*pi*5000*t);
n1=sqrt(1)*randn(1,length(t));
n2=sqrt(2)*randn(1,length(t));
n3=sqrt(4)*randn(1,length(t));
%% Compute
x1WITHn1=x1+n1;
x1WITHn2=x1+n2;
x1WITHn3=x1+n3;
x2WITHn1=x2+n1;
x2WITHn2=x2+n2;
x2WITHn3=x2+n3;
w=linspace(0,2*pi,length(t));
%% Plot
subplot(4,4,1);
plot(t,x1);axis tight;xlabel('t');title('original input');
subplot(4,4,2);
plot(t,x1WITHn1);axis tight;xlabel('t');title('original input with vari.1 noise');
subplot(4,4,3);
plot(t,x1WITHn2);axis tight;xlabel('t');title('original input with vari.2 noise');
subplot(4,4,4);
plot(t,x1WITHn3);axis tight;xlabel('t');title('original input with vari.4 noise');
subplot(4,4,5);
plot(w/pi,abs(fft(x1)));axis tight;xlabel('\omega*\pi');title('FT{original input}');
subplot(4,4,6);
plot(w/pi,abs(fft(x1WITHn1)));axis tight;xlabel('\omega*\pi');title('FT{original input with vari.1 noise}');
subplot(4,4,7);
plot(w/pi,abs(fft(x1WITHn2)));axis tight;xlabel('\omega*\pi');title('FT{original input with vari.2 noise}');
subplot(4,4,8);
plot(w/pi,abs(fft(x1WITHn3)));axis tight;xlabel('\omega*\pi');title('FT{original input with vari.4 noise}');
subplot(4,4,9);
plot(t,x2);axis tight;xlabel('t');title('original input');
subplot(4,4,10);
plot(t,x2WITHn1);axis tight;xlabel('t');title('original input with vari.1 noise');
subplot(4,4,11);
plot(t,x2WITHn2);axis tight;xlabel('t');title('original input with vari.2 noise');
subplot(4,4,12);
plot(t,x2WITHn3);axis tight;xlabel('t');title('original input with vari.4 noise');
subplot(4,4,13);
plot(w/pi,abs(fft(x2)));axis tight;xlabel('\omega*\pi');title('FT{original input}');
subplot(4,4,14);
plot(w/pi,abs(fft(x2WITHn1)));axis tight;xlabel('\omega*\pi');title('FT{original input with vari.1 noise}');
subplot(4,4,15);
plot(w/pi,abs(fft(x2WITHn2)));axis tight;xlabel('\omega*\pi');title('FT{original input with vari.2 noise}');
subplot(4,4,16);
plot(w/pi,abs(fft(x2WITHn3)));axis tight;xlabel('\omega*\pi');title('FT{original input with vari.4 noise}');
%% b
figure('Name','Question 1 (b)');

%% ///////////////
%% Define
Fs=fs;
wp=0.03*pi;ws=0.05*pi;
As=50; Rp=0.1;
%% Compute
deltaF=ws-wp;
deltaP=(10^(Rp/20)-1)/(10^(Rp/20)+1);
deltaS=(1+deltaP)/(10^(As/20));
[M,fo,ao,W]=firpmord([wp,ws]/pi,[1,0],[deltaP,deltaS]);
% % M
newM=M+7;
% % N=orderFromAlgorithm(deltaP,deltaS,deltaF)
[h1,delta] = firpm(newM,fo,ao,W);
% % w4h=-(length(h)-1)/2:(length(h)-1)/2;
% % delta
% % H=db(fft(h,1024));
% % w4H=linspace(0,2*pi,length(H));
% % %% Plot
% % subplot(1,2,1);
% % stem(w4h,h),xlabel('n');title(['ori. order=',int2str(M),',order=',int2str(newM),',order of algorithm=',int2str(N),',impulse response']);axis tight;
% % subplot(1,2,2);
% % plot(w4H/pi,H);xlabel('\omega/\pi');title('magnitude response');grid on;axis tight;
% % figure;
%% //////
%% //////
%% Define
w1s=0.1*pi; w1p=0.15*pi;
w2s=0.3*pi; w2p=0.25*pi;
As=60; Rp=1;
%% Compute
deltaF=w1p-w1s;
deltaP=(10^(Rp/20)-1)/(10^(Rp/20)+1);
deltaS=(1+deltaP)/(10^(As/20));
[M,fo,ao,W]=firpmord([w1s,w1p,w2p,w2s]/pi,[0,1,0],[deltaS,deltaP,deltaS]);
% % % M
newM=M+101;
% % N=orderFromAlgorithm(deltaP,deltaS,deltaF)
[h2,delta] = firpm(newM,fo,ao,W);
% % w4h=-(length(h)-1)/2:(length(h)-1)/2;
% % delta
% % H=db(fft(h,1024));
% % w4H=linspace(0,2*pi,length(H));
% % %% Plot
% % subplot(1,2,1);
% % stem(w4h,h),xlabel('n');title(['ori. order=',int2str(M),',order=',int2str(newM),',order of algorithm=',int2str(N),',impulse response']);axis tight;
% % subplot(1,2,2);
% % plot(w4H/pi,H);xlabel('\omega/\pi');title('magnitude response');grid on;axis tight;
% % figure;
%% //////

y1WITHn1=conv(h1,x1WITHn1);
y1WITHn2=conv(h1,x1WITHn2);
y1WITHn3=conv(h1,x1WITHn3);
y2WITHn1=conv(h2,x2WITHn1);
y2WITHn2=conv(h2,x2WITHn2);
y2WITHn3=conv(h2,x2WITHn3);
shift_1=length(h1)-1;
shift_2=length(h2)-1;
shift_1=shift_1/2;
shift_2=shift_2/2;
L=length(y1WITHn1);
y1WITHn1=y1WITHn1(shift_1:L-shift_1-1);
y1WITHn2=y1WITHn2(shift_1:L-shift_1-1);
y1WITHn3=y1WITHn3(shift_1:L-shift_1-1);
L=length(y2WITHn1);
y2WITHn1=y2WITHn1(shift_2:L-shift_2-1);
y2WITHn2=y2WITHn2(shift_2:L-shift_2-1);
y2WITHn3=y2WITHn3(shift_2:L-shift_2-1);

%% Plot
subplot(4,4,1);
plot(t,x1);axis tight;xlabel('t');title('original input');
subplot(4,4,2);
plot(t,y1WITHn1);axis tight;xlabel('t');title('noise 1 through filter');
subplot(4,4,3);
plot(t,y1WITHn2);axis tight;xlabel('t');title('original input with vari.2 noise');
subplot(4,4,4);
plot(t,y1WITHn3);axis tight;xlabel('t');title('original input with vari.4 noise');
subplot(4,4,5);
plot(w/pi,abs(fft(x1)));axis tight;xlabel('\omega*\pi');title('FT{original input}');
subplot(4,4,6);
plot(w/pi,abs(fft(y1WITHn1)));axis tight;xlabel('\omega*\pi');title('FT{original input with vari.1 noise}');
subplot(4,4,7);
plot(w/pi,abs(fft(y1WITHn2)));axis tight;xlabel('\omega*\pi');title('FT{original input with vari.2 noise}');
subplot(4,4,8);
plot(w/pi,abs(fft(y1WITHn3)));axis tight;xlabel('\omega*\pi');title('FT{original input with vari.4 noise}');
subplot(4,4,9);
plot(t,x2);axis tight;xlabel('t');title('original input');
subplot(4,4,10);
plot(t,y2WITHn1);axis tight;xlabel('t');title('original input with vari.1 noise');
subplot(4,4,11);
plot(t,y2WITHn2);axis tight;xlabel('t');title('original input with vari.2 noise');
subplot(4,4,12);
plot(t,y2WITHn3);axis tight;xlabel('t');title('original input with vari.4 noise');
subplot(4,4,13);
plot(w/pi,abs(fft(x2)));axis tight;xlabel('\omega*\pi');title('FT{original input}');
subplot(4,4,14);
plot(w/pi,abs(fft(y2WITHn1)));axis tight;xlabel('\omega*\pi');title('FT{original input with vari.1 noise}');
subplot(4,4,15);
plot(w/pi,abs(fft(y2WITHn2)));axis tight;xlabel('\omega*\pi');title('FT{original input with vari.2 noise}');
subplot(4,4,16);
plot(w/pi,abs(fft(y2WITHn3)));axis tight;xlabel('\omega*\pi');title('FT{original input with vari.4 noise}');

%% Question 2
clear all;clc;
%figure('Name','Question 2');
%% Define
fo=3.5e3;
Fs=10e3;
t=0:1/Fs:.1-1/Fs;
m = sin(2*pi*500*t) + .5*sin(2*pi*600*t) + 2*sin(2*pi*700*t);
N=length(m);
%% Compute
% hilbert
M = 25;
alpha = (M-1)/2;
n=-alpha:1:alpha;
n=n+eps;
hd=(2/pi)* sin(pi*n/2).^2 ./ (n);
h=conv(hd,m);
L=length(h);
shift=length(hd)-1;
shift=shift/2;
h=h(shift:L-shift-1);
number=1:N;
y2=h.*sin(2*pi*fo*number/Fs);

m_shift=[zeros(1,alpha),m(1:end-alpha)];
y1=m_shift.*cos(2*pi*fo*number/Fs);

y=y1+y2;

hh=spectrum.periodogram;
opts=msspectrumopts(hh,m);
opts.NFFT = 4096;
opts.Fs=Fs;
opt.CenterDC = true;
f=m.*cos(2*pi*fo*t);
figure;
% Xlims =get(gca,'XLim');
% set(gca,'XLim',Xlims,'YLim',[-75 0]);
d=fdesign.hilbert('N,TW',60,.1);
Hd = design(d,'equiripple');
hfv = fvtool(Hd,'Analysis','Magnitude',...
    'MagnitudeDisplay','Zero-phase',...
    'FrequencyRange','[-pi, pi)');
hfv.Color = 'white';

m_tilde=filter(Hd,m);

G=order(Hd)/2;
m_delayed=[zeros(1,G),m(1:end-G)];
f2=m_delayed.*cos(2*pi*fo*t) - m_tilde.*sin(2*pi*fo*t);
msspectrum(hh,f2,opts);
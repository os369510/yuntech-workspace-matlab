close all;clear all;clc;

%% Question 2
figure('Name','(a) of Question 2');
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
hd1By8bit = round(hd1*255)/255;
hd1By12bit = round(hd1*4095)/4095;
hd2By8bit = round(hd2*255)/255;
hd2By12bit = round(hd2*4095)/4095;
hamming=0.54-0.46*cos(2*pi.*n1/(M1-1));
blackman=0.42-0.5*cos((2*pi.*n2)/(M2-1))+0.08*cos((4*pi.*n2)/(M2-1));
hh=hamming.*hd1;
hb=blackman.*hd2;
hhBy8bit = hamming.*hd1By8bit;
hhBy12bit = hamming.*hd1By12bit;
hbBy8bit = blackman.*hd2By8bit;
hbBy12bit = blackman.*hd2By12bit;
Hh=20*log10(abs(fft(hh,2048)));
Hb=20*log10(abs(fft(hb,2048)));
HhBy8bit = 20*log10(abs(fft(hhBy8bit,2048)));
HhBy12bit = 20*log10(abs(fft(hhBy12bit,2048)));
HbBy8bit = 20*log10(abs(fft(hbBy8bit,2048)));
HbBy12bit = 20*log10(abs(fft(hbBy12bit,2048)));
Hh=Hh(1:1024);
Hb=Hb(1:1024);
HhBy8bit=HhBy8bit(1:1024);
HhBy12bit=HhBy12bit(1:1024);
HbBy8bit=HbBy8bit(1:1024);
HbBy12bit=HbBy12bit(1:1024);
w=linspace(0,1,1024);
%% Plot
subplot(2,3,1);
stem(hd1);axis tight;xlabel('n');ylabel('value');title('ideal BPF sequence');
subplot(2,3,2);
stem(hamming);axis tight;xlabel('n');ylabel('value');title('hamming window');
subplot(2,3,3);
plot(w,Hh);axis tight;xlabel('omega');ylabel('magnitude');title('ideal BPF');
subplot(2,3,4);
stem(hd2);axis tight;xlabel('n');ylabel('value');title('ideal BPF sequence');
subplot(2,3,5);
stem(blackman);axis tight;xlabel('n');ylabel('value');title('blackman window');
subplot(2,3,6);
plot(w,Hb);axis tight;xlabel('omega');ylabel('magnitude');title('ideal BPF');

figure('Name','(b) 8bit of Question 2');
subplot(2,3,1);
stem(hd1By8bit);axis tight;xlabel('n');ylabel('value');title('ideal BPF sequence (8bit)');
subplot(2,3,2);
stem(hamming);axis tight;xlabel('n');ylabel('value');title('hamming window');
subplot(2,3,3);
plot(w,HhBy8bit);axis tight;xlabel('omega');ylabel('magnitude');title('ideal BPF');
subplot(2,3,4);
stem(hd2By8bit);axis tight;xlabel('n');ylabel('value');title('ideal BPF sequence (8bit)');
subplot(2,3,5);
stem(blackman);axis tight;xlabel('n');ylabel('value');title('blackman window');
subplot(2,3,6);
plot(w,HbBy8bit);axis tight;xlabel('omega');ylabel('magnitude');title('ideal BPF');

figure('Name','(b) 12bit of Question 2');
subplot(2,3,1);
stem(hd1By12bit);axis tight;xlabel('n');ylabel('value');title('ideal BPF sequence (12bit)');
subplot(2,3,2);
stem(hamming);axis tight;xlabel('n');ylabel('value');title('hamming window');
subplot(2,3,3);
plot(w,HhBy12bit);axis tight;xlabel('omega');ylabel('magnitude');title('ideal BPF');
subplot(2,3,4);
stem(hd2By12bit);axis tight;xlabel('n');ylabel('value');title('ideal BPF sequence (12bit)');
subplot(2,3,5);
stem(blackman);axis tight;xlabel('n');ylabel('value');title('blackman window');
subplot(2,3,6);
plot(w,HbBy12bit);axis tight;xlabel('omega');ylabel('magnitude');title('ideal BPF');

clear all;
%% Question 3
figure('Name','Question 3');
%% Define
Omg1c=pi/3;
Omg2c=2*pi/3;
As=60;
deltaF=pi/10;
M=73;
B=5.6533;
%% Compute
a=(M+1)/2;
n=1:M;
hd11=sin(Omg1c*(n-a+eps))./(pi*(n-a+eps));
hd12=sin(Omg2c*(n-a+eps))./(pi*(n-a+eps));
p=[zeros(1,(M-1)/2),1,zeros(1,(M-1)/2)];
hd=p-(hd12-hd11);
kwindow=(kaiser(M,B))';
h=kwindow.*hd;
H=20*log10(abs(fft(h,2048)));
H=H(1:1024);
w=linspace(0,1,1024);
%% Plot
subplot(1,3,1);
stem(hd);axis tight;xlabel('n');ylabel('value');title('ideal BSF sequence');
subplot(1,3,2);
stem(kwindow);axis tight;xlabel('n');ylabel('value');title('kaiser window');
subplot(1,3,3);
plot(w,H);axis tight;xlabel('omega');ylabel('magnitude');title('ideal BSF');

clear all;
%% Question 4
figure('Name','(a) of Question 4');
%% Define
M=101;
%% Compute
a=(M+1)/2;
n=1:M;
hd=(cos(pi*(n-a+eps)))./(n-a+eps);
hd(a)=0;
hd2=((cos(pi.*(n-a+eps)))./(n-a+eps)) - ((sin(pi.*(n-a+eps)))./(pi.*(n-a+eps).^2));
hd2(a)=0;
hamming=0.54-0.46*cos(2*pi.*n/(M-1));
h=hamming.*hd;
H=20*log10(abs(fft(h,2048)));
HH=abs(fft(h,2048));
H=H(1:1024);
HH=HH(1:1024);
w=linspace(0,1,1024);

m1=linspace(0,10*pi,1024);

x1=sin(0.2*m1);
x2=cos(0.7*m1);
x3=sin(0.85*m1);
yByX1=conv(x1,h);
yByX2=conv(x2,h);
yByX3=conv(x3,h);
yByX1=yByX1(length(h):length(yByX1)-(length(h)-1));
yByX2=yByX2(length(h):length(yByX2)-(length(h)-1));
yByX3=yByX3(length(h):length(yByX3)-(length(h)-1));
m2=linspace(0,10*pi,length(yByX1));
%% Plot
subplot(1,3,1);
stem(h);axis tight;xlabel('n');ylabel('value');title('sequence');
subplot(1,3,2);
stem(hamming);axis tight;xlabel('n');ylabel('value');title('hamming window');
subplot(1,3,3);
plot(w,HH);axis tight;xlabel('omega');ylabel('magnitude');title('freq. domain');

figure('Name','(b) of Question 4');
subplot(2,3,1);
plot(m1/pi,x1);axis tight;xlabel('pi');ylabel('value');title('sin(0.2*\pi*n)');
subplot(2,3,2);
plot(m1/pi,x2);axis tight;xlabel('pi');ylabel('value');title('cos(0.7*\pi*n)');
subplot(2,3,3);
plot(m1/pi,x3);axis tight;xlabel('pi');ylabel('value');title('sin(0.85*\pi*n)');
subplot(2,3,4);
plot(m2/pi,yByX1);axis tight;xlabel('|| ~ ->pi');ylabel('value');title('output of sin(0.2*\pi*n)');
subplot(2,3,5);
plot(m2/pi,yByX2);axis tight;xlabel('|| ~ ->pi');ylabel('value');title('output of cos(0.7*\pi*n)');
subplot(2,3,6);
plot(m2/pi,yByX3);axis tight;xlabel('|| ~ ->pi');ylabel('value');title('output of sin(0.85*\pi*n)');

clear all;
%% Question 5
figure('Name','Question 5');
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
xxx=(-1).^n1;
hd1=sin(OmgC*(n1-a1+eps))./(pi*(n1-a1+eps));
hd2=sin(OmgC*(n2-a2+eps))./(pi*(n2-a2+eps));
hamming=0.54-0.46*cos(2*pi.*n1/(M1-1));
blackman=0.42-0.5*cos((2*pi.*n2)/(M2-1))+0.08*cos((4*pi.*n2)/(M2-1));
hh=hamming.*hd1;
hb=blackman.*hd2;
Hh=abs(fft(hh,2048));
Hb=20*log10(abs(fft(hb,2048)));
Hh=Hh(1:1024);
Hb=Hb(1:1024);
w=linspace(0,1,1024);

n=linspace(0,100*pi,1024);
x=sin(0.1*n);
noise1=0.1*randn(1,length(n));
noise2=0.1*randn(1,length(n)).*sqrt(4);
noise3=0.1*randn(1,length(n)).*sqrt(8);
x1=x+noise1;
x2=x+noise2;
x3=x+noise3;
X1=abs(fft(x1,2048));
X1=X1(1:1024);
X2=abs(fft(x2,2048));
X2=X2(1:1024);
X3=abs(fft(x3,2048));
X3=X3(1:1024);
y1=conv(x1,hh);
y2=conv(x2,hh);
y3=conv(x3,hh);

%% Plot
subplot(4,3,1);
stem(hd1);axis tight;xlabel('n');ylabel('value');title('ideal LPF sequence');
subplot(4,3,2);
plot(w,Hh);axis tight;xlabel('omega');ylabel('magnitude');title('ideal LPF');
subplot(4,3,3);
stem(hamming);axis tight;xlabel('n');ylabel('value');title('hamming window');
subplot(4,3,4);
plot(x);axis tight;xlabel('n');ylabel('value');title('input with noise 1 (variance=1)');
subplot(4,3,5);
plot(w,X1);axis tight;xlabel('n');ylabel('value');title('freq. domain of input1');
subplot(4,3,6);
plot(y1);axis tight;xlabel('omega');ylabel('magnitude');title('output1');
subplot(4,3,7);
plot(x2);axis tight;xlabel('n');ylabel('value');title('input with noise 2 (variance=4)');
subplot(4,3,8);
plot(w,X2);axis tight;xlabel('n');ylabel('value');title('freq. domain of input2');
subplot(4,3,9);
plot(y2);axis tight;xlabel('omega');ylabel('magnitude');title('output2');
subplot(4,3,10);
plot(x3);axis tight;xlabel('n');ylabel('value');title('input with noise 3 (variance=8)');
subplot(4,3,11);
plot(w,X3);axis tight;xlabel('n');ylabel('value');title('freq. domain of input3');
subplot(4,3,12);
plot(y3);axis tight;xlabel('omega');ylabel('magnitude');title('output3');

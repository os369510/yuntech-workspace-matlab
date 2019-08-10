close all;clear all;clc;
% ideal low pass filter equation
N=25; % filter length
M=N-1;
w=-M/2:1:M/2;
wc=.05;
hd=zeros(1,N);
for i=1:1:length(hd)
    if(i~=M/2+1)
        hd(i)=sin(wc*((i-1)-(M/2)))/(pi*((i-1)-(M/2)));
    end
    if(i==M/2+1)
        hd(i)=wc/pi;
    end
end
subplot(3,2,1);
stem(w,hd);
% hamming window 
for i=1:1:length(hd)
    wn(i)=0.54-0.46*cos(2*pi*(i-1)/M);
end
subplot(3,2,2)
stem(wn)
axis tight;
% filter * window
h=hd.*wn;
subplot(3,2,3)
stem(h)
axis tight;
% h[n] in frequency domain
H=fft(h,1024);
wh=linspace(0,2*pi,length(H));
subplot(3,2,4)
plot(wh/pi,abs(H));
xlabel('pi');
axis tight;
% create signal 
fs=1000; %sample frequency 1000hz
wx=linspace(0,pi,1024);
for i=1:1:1024
    x(i)=2*sin(wx(i)*200)+sin(wx(i)*700);
end
X=fft(x,1024);
subplot(3,2,5)
plot(wh/pi,abs(X));
xlabel('pi');
axis tight;
% convolution
result=conv(h,x);
Result=fft(result,1024);
subplot(3,2,6)
plot(wh/pi,abs(Result));
xlabel('pi');
axis tight
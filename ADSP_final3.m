clear all;clc;
load observed_signal;
% initialized
fs=10e3;
wp=[2.975e3,3.025e3]*2/fs; % setting passband edge
ws=[2.9e3,3.1e3]*2/fs; % setting stopband edge
rp=1; % (dB) setting passband ripple
rs=40; % (dB) setting stopband ripple
%compute
[N,wn]=cheb1ord(wp,ws,rp,rs);
[b,a]=cheby1(N,rp,wn,'bandpass');
H=abs(freqz(b,a,fs/2));
H=H';
H1=H;
H2=fliplr(H);
H=[H1,H2];
h=(ifft(H));
h=h./max(h);
x_filtered=conv(x,h);
x_filtered=[x_filtered(round(length(x_filtered)/2)+1:length(x_filtered)),(x_filtered(1:round(length(x_filtered)/2)))];
subplot(2,2,1);
plot(x);
title('input signal(time domain)');xlabel('sample');ylabel('value');axis tight;
subplot(2,2,2);
w=linspace(0,fs,length(x));
plot(w,abs(fft(x)));
title('input signal(frequency domain)');xlabel('frequency');ylabel('value');axis tight;
subplot(2,2,3);
plot(real(x_filtered))
title('filtered signal(time domain)');xlabel('sample');ylabel('value');axis tight;
subplot(2,2,4);
plot(abs(fft((x_filtered))))
title('filtered signal(frequency response)');xlabel('frequency');ylabel('value');axis tight;
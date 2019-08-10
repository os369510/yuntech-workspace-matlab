clear all;clc;
% n=0:100;
b=[1.6 ,-3.5, 7.9];
a=[2, 5, -8, -1.4];
[h,W]=freqz(b,a,1024);
w=linspace(0,pi,length(h));
subplot(2,1,1);
plot(w/pi,abs(h));
title('magnitude response');xlabel('frequency');ylabel('value');axis tight;
subplot(2,1,2);
plot(w/pi,angle(h));
title('phase response');xlabel('frequency');ylabel('angle');%axis([0 2 -1 1]);
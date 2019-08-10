close all;clear all;clc;
wn=hamming(512);
Fs=3000;
[lp]=ideal_lp(800*2*pi/Fs,512);
t=(0:1/Fs:1);
test=sin(500*2*pi*t)+sin(1000*2*pi*t);
h=lp.*wn';
w=linspace(0,Fs,Fs+1);
ww=linspace(0,Fs,512);


%result=conv(h,test);
result=zeros(1,3512);
for i=256:1:3256
    for k=512:-1:1
        result(i)=h(k)*
    
    
    
    
    
    
    
    
    
    

    
    
    
end    



result=result(256:3256);
subplot(3,2,1);
plot(test);axis tight;
subplot(3,2,2);
plot(w,abs(fft(test)));axis tight;
subplot(3,2,3);
plot(h);axis tight;
subplot(3,2,4);
plot(ww,abs(fft(h)));axis tight;
subplot(3,2,5);
plot(result);axis tight;
subplot(3,2,6);
plot(w,abs(fft(result)));axis tight;

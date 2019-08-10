close all;clear all;clc;
%% Def.
x=imread('d75-1.bmp');
% Ts=42.5*1000/5000; %micro
Ts=1/5000;
Fs=1/Ts;
%% Compute
x=rgb2gray(x);
x1=x';
y=x1(:,21:1000);
y1=bwlabel(logical(y),4);
y1=(y1==3);
y2=zeros(1,980);
for xi=1:1:980
    sum=0;
    count=0;
    for yi=1:1:150
        if(y1(yi,xi)==1)
            count=count+1;
            sum=sum+(150-yi);
        end
    end
    y2(xi)=sum/count;
end
% y2min=min(y2);
% y2max=max(y2);
% y2medi=(y2min+y2max)/2;
y2=y2-150/2;
Y2=abs(fft(y2,length(y2)*10));
Y2w=linspace(0,Fs,length(Y2));

delF=50/Fs;
fcut=200/Fs;
fcut=(3.3/fcut);
if mod(fcut,2)==0
    fcut=fcut+1;
end
hd=JsLPF(delF,fcut);
w=hamming(length(hd))';
h=hd.*w;
H=abs(fft(h,length(Y2)));
y3=conv(h,y2);
y3=y3(length(h)/2:length(y3)-length(h)/2);


%% Plot
subplot(2,3,1);
imshow(y1);
subplot(2,3,2);
plot(y2);axis tight;
subplot(2,3,3);
plot(Y2w,Y2);axis tight;

subplot(2,3,4);
plot(hd);axis tight;
subplot(2,3,5);
plot(H);axis tight;
subplot(2,3,6);
plot(y3);
% axis tight;
axis([0 980 -75*3 75*3])
grid on;
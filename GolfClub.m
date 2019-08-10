close all;clear all;clc;
x=imread('4-4.bmp');
% Output=sFuzzyRules3x3(x,3);
s=sum(x(:,:)');
plot(s);
figure;
sdiff=imfilter(s,[-1 1]);
sdiff=abs(sdiff);
plot(sdiff(5:955));
figure;
sdiffmid=medfilt2(sdiff,[1,5]);
plot(sdiffmid(5:955));
figure;
sdoublediff=imfilter(sdiffmid,[-1 1]);
sdoublediff=abs(sdoublediff);
plot(sdoublediff(5:955));
figure;
sdoublediff=sdoublediff.*255./max(sdoublediff);
% sotsu=im2bw(sdoublediff);
plot(abs(sdoublediff(5:955)));
figure;


kernel1=[-1 -1 -1;0 0 0 ;1 1 1];
kernel2=[-1 0 1;-1 0 1 ;-1 0 1];
y1=imfilter(x,kernel1);
y2=imfilter(x,kernel2);
Output=y1+y2;
Output=im2bw(Output,30/255);
imshow(x)
figure;
Output=medfilt2(Output,[3,3]);
imshow(Output);
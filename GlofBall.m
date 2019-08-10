close all;clear all;clc;
x=imread('º£µ²¶ô2.bmp');
% Output=sFuzzyRules3x3(x,3);
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
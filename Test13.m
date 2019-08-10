 close all;clear all;clc;
 % 96 : 5:100 1
 % 98 : 1
 % 99 : 2
% level=20;
%材料顏色和膠帶顏色
m_index=0;
b_index=1;

%縱向起始檢測位址和結束位址
first=0;
last=1500;
length=last-first;

%橫向起始檢測位址和結束位址
width_first=200;
width_last=7092;

%影像寬度
im_width=7392;
im_half_width=im_width/2;

%讀入影像
% x=imread('95A1814AC__2__1.bmp');
x=imread('8989_AboveDatabase1000.bmp');
x=rgb2gray(x);
%filter資訊
k=11;
kernel=ones(k,1)/k;
p_filter1=imfilter(x,kernel);

kernel_2=fspecial('log',[1,21],2.0)
p_filter2=imfilter(p_filter1,kernel_2);

figure;
imshow(p_filter2*255)
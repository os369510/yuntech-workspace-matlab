 close all;clear all;clc;
 % 96 : 5:100 1
 % 98 : 1
 % 99 : 2
% level=20;
%�����C��M���a�C��
m_index=0;
b_index=1;

%�a�V�_�l�˴���}�M������}
first=0;
last=1500;
length=last-first;

%��V�_�l�˴���}�M������}
width_first=200;
width_last=7092;

%�v���e��
im_width=7392;
im_half_width=im_width/2;

%Ū�J�v��
% x=imread('95A1814AC__2__1.bmp');
x=imread('8989_AboveDatabase1000.bmp');
x=rgb2gray(x);
%filter��T
k=11;
kernel=ones(k,1)/k;
p_filter1=imfilter(x,kernel);

kernel_2=fspecial('log',[1,21],2.0)
p_filter2=imfilter(p_filter1,kernel_2);

figure;
imshow(p_filter2*255)
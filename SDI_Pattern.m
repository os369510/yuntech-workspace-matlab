close all;clear all;clc;
%Initialize
Input_502_1=imread('SDI_L502_1.bmp');
Input_894_1=imread('SDI_894_1.bmp');
Input_1106_1=imread('SDI_1106_1.bmp');
Input_1498_1=imread('SDI_1498_1.bmp');
Input_1800_1=imread('SDI_1800_1.bmp');

%% 
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
x=Input_1800_1;
% x=rgb2gray(x);

%filter資訊
k=11;
kernel=ones(k,1)/k;
p_filter1=imfilter(x,kernel);

kernel_2=[-1 0 1;-1 0 1;-1 0 1];
kernel_3=[1 0 -1;1 0 -1;1 0 -1];
p_filter2=imfilter(p_filter1,kernel_2);
p_filter3=imfilter(p_filter1,kernel_3);
p_filter4=(p_filter2+p_filter3)/2;
pf4_sum=round((sum(p_filter4(:,:))/length));
% pf4_sum=round((pf4_sum/max(pf4_sum))*255);
p_filter=uint8(round(p_filter2));
pf4_sum = uint8(pf4_sum);

figure('Name','Origin','NumberTitle','off');
imshow(x);
figure('Name','p_filter4_histogram','NumberTitle','off')
plot(pf4_sum);
axis tight;

level4=graythresh(pf4_sum)
figure('Name','p_filter4_histogram_ot','NumberTitle','off')
pf4_sum_th = im2bw(pf4_sum, level4);
% pf4_sum_th=  pf4_sum>=level4*255;
plot(pf4_sum_th);
axis tight;
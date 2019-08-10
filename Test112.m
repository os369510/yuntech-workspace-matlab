 close all;clear all;clc;
 % 96 : 5:100 1
 % 98 : 1
 % 99 : 2
% level=20;
% standard : 3641 4611 4804 6105 6296 7269
% 0 : 3642 4611 4803 6105 6296 7269
% 1 : 3646 4612 4804 6106 6297 7270

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
x=imread('1.bmp');
% x=rgb2gray(x);
% for i = 1:1:1500
%     for j = 1:1:7392
%         x(i,j)=sCurveImage(x(i,j),0.5);
%     end
% end
x = double(x);
x = 255 * (x/255).^ 0.8;
x=uint8(x);
% x=rgb2gray(x);

%filter資訊
% k=11;
% kernel=ones(k,1)/k;
% p_filter1=imfilter(x,kernel);
p_filter1=x;

kernel_2=[-1 0 1;-1 0 1;-1 0 1];
kernel_3=[1 0 -1;1 0 -1;1 0 -1];
kernel_s=[-1 -1 -1;-1 8 -1;-1 -1 -1];
p_filter2=imfilter(p_filter1,kernel_2);
p_filter3=imfilter(p_filter1,kernel_3);
p_filter4=(p_filter2+p_filter3)/2;
p_filters=imfilter(p_filter1,kernel_s);
pf4_sum=round((sum(p_filter4(:,:))/length));
pfs_sum=round((sum(p_filters(:,:))/length));
% pf4_sum=round((pf4_sum/max(pf4_sum))*255);
p_filter=uint8(round(p_filter2));
pf4_sum = uint8(pf4_sum);

%%
ImageROI=p_filter1(597:601,:);
ImageDiff1_L = imfilter(ImageROI,kernel_2);
ImageDiff1_R = imfilter(ImageROI,kernel_3);
ImageDiff1=(ImageDiff1_L+ImageDiff1_R)/2;

ImageDiff2_L=imfilter(ImageDiff1,kernel_2);
ImageDiff2_R=imfilter(ImageDiff1,kernel_2);
ImageDiff2=(ImageDiff2_L+ImageDiff2_R)/2;

ImageDiff1_sum=round((sum(ImageDiff1(:,:))/5));
ImageDiff2_sum=round((sum(ImageDiff2(:,:))/5));

% ImageOtsu=im2bw(

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


figure('Name','s','NumberTitle','off')
plot(ImageDiff2_sum);
axis tight;
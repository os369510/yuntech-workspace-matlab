close all;clear all;clc;
%% Initialize
% x=imread('yellowPoint.jpg');
% x=imread('2.bmp');
% x=imread('ClampTrail.jpg');
% x=imread('¯}¬}N.bmp');
x=imread('Äé¥WN.bmp');
% x=imread('¸}¬[²ªP.bmp');
range=325;
x_ROI=x(457-range:457+range,611-range:611+range);
%% Compute
h_gaussian=fspecial('gaussian',[11 11],3);
y_gaussian=conv2(x_ROI,h_gaussian);
y_g_sobel=edge(y_gaussian,'sobel',125/255);
se=strel('rectangle',[3,3]);
y_g_s_dilation=imdilate(y_g_sobel,se);
bw3=bwmorph(y_g_s_dilation,'skel',Inf);
[y_labeling,N]=bwlabel(bw3,8);

%y_sS=sSkeletonByErosion(y_g_s_dilation);
% y_g_s_closing=imclose(y_g_sobel,se);
% y_sS=sSkeletonByErosion(y_g_s_closing);
% y_sobel=edge(x_ROI,'sobel',3/255);
% y_canny=edge(x_ROI,'canny',[3 50]/255);
% y_and=and(y_sobel,y_canny);
%% Plot
figure('Name','original');
imshow(x_ROI);
% figure('Name','g s');
% imshow(y_gaussian);
figure('Name','g s');
imshow(y_g_sobel);
figure('Name','dilation');
imshow(y_g_s_dilation);
figure('Name','Skeleton');
imshow(bw3);
% figure('Name','closing');
% imshow(y_g_s_closing);
% figure('Name','New alg.');
% imshow(y_sS);
% figure('Name','sobel');
% imshow(y_sobel);
% figure('Name','canny');
% imshow(y_canny);
% figure('Name','and');
% imshow(y_and);
%% Check
% figure('Name','check');
% meshz(y_gaussian);
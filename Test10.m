clc;clear all;close all;
p=imread('2.bmp');
% p=imread('6_1800.bmp');
level=graythresh(p);
%p1=im2bw(p);
p=medfilt2(p,[9,9]);
% pp=fspecial('gaussian',[21,21]);
% p=filter2(pp,p)/256;
y1=im2bw(p,180/255);
y2=im2bw(p,level);
y3=im2bw(p,15/255);
% bb=edge(pf,'sobel');
% imwrite(bb,'Sobel.bmp');
% bb=edge(pf,'prewitt');
% imwrite(bb,'Prewitt.bmp');
% bb=edge(pf,'roberts');
% imwrite(bb,'Roberts.bmp');
% bb=edge(pf,'log');
% imwrite(bb,'Laplacian.bmp');
% bb=edge(pf,'canny');
% imwrite(bb,'Canny.bmp');
%bw=edge(pf,'canny');
% x=15000/500;
% k=0;
% for i=1:500:1+(x-1)*500
%     k=k+1;
%     pic=p(i:i+499,:);
%     imwrite(pic,['pic',num2str(k),'.bmp']);
% end
imshow(p);
figure;
imshow(y1);
figure;
imshow(y2);
imwrite(y2,'y2.bmp')
figure;
imshow(y3);
%imwrite(BW,'threshold15.bmp')

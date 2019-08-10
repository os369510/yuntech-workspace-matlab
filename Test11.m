clc;clear all;close all;
p=imread('1400-1.png');

level=graythresh(p);
% p=imread('6_1800.bmp');
% p_size=size(p);
% m=11;
% p_filter=p;
% 
% for i = (m+1)/2:1:(p_size(1)-(m-1)/2)
%     for k=-(m-1)/2:1:(m-1)/2
%         p_filter(i-(m-1)/2,:)=p_filter(i-(m-1)/2,:)+p(i+k,:);
%     end
%     p_filter(i-(m-1)/2,:)=p_filter(i-(m-1)/2,:)/m;
% end
k=11;
c=[35.223 32.95 25.35 20.75 13.15 10.877 10.877 13.15 20.75 25.35 32.95 35.223];
M_width=91.5;
% h=[0,0,1,0,0;
%     0,0,1,0,0;
%     0,0,1,0,0;
%     0,0,1,0,0;
%     0,0,1,0,0;]
h=ones(k,1)/k;
p_filter=imfilter(p,h);
p_filter=im2bw(p_filter,level);

% level=graythresh(p);
% %p1=im2bw(p);
% p=medfilt2(p,[9,9]);
% % pp=fspecial('gaussian',[21,21]);
% % p=filter2(pp,p)/256;
% y1=im2bw(p,180/255);
% y2=im2bw(p,level);
% y3=im2bw(p,15/255);


imshow(p);
figure;
imshow(p_filter);
% figure;
% imshow(y2);
% imwrite(y2,'y2.bmp')
% figure;
% imshow(y3);
%imwrite(BW,'threshold15.bmp')

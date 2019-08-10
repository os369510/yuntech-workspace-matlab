% close all;clear all;clc;
% A=[1,2,3,4;5,6,7,8;9,10,11,12;13,14,15,16];
% A1=A(2:3,2:3)
% A2=A1'
% A3=A;
% A3(3,:)=[];
% A3(:,3)=[]
% A4=A(4,:)*A(:,4)
close all;clear all;clc;
source=imread('baboon.bmp');
result=257-source;
subplot(3,3,1);
imshow(source);title('原圖');
subplot(3,3,2);
imshow(source);title('原圖');
subplot(3,3,3);
imshow(source);title('原圖');
subplot(3,3,6);
imshow(result);title('負片');
subplot(3,3,8);
imshow(result);title('負片');
imwrite(result,'baboon_result.bmp');
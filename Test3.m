 clear all;clc;
level=55;
% level=20;
x=imread('6-1.bmp');
% x=rgb2gray(x);
x1=medfilt2(x,[15,15]);
x_otsu=im2bw(x1,level/255);
% x_otsu=double(x_otsu);
% x_otsu=imrotate(x_otsu,0.125);
% x_label=bwlabel(x_otsu,4);
% x_reg=regionprops(x_label,'Centroid');%'BoundingBox');
y=x_otsu;
imshow(y);
imwrite(y,'6-1_new.bmp');


% y label = 3860
% x = 666 b     , 667 w
% x = 2509 w    , 2510 b
% x = 3117 b    , 3118 w
% x = 4356 w    , 4357 b
% x = 4969 b    , 4970 w
% x = 6727 w    , 6728 b
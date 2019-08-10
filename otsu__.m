clear 
close all
I = imread('test1.bmp');
I = rgb2gray(I);
level = graythresh(I);
level=68/255;
BW = im2bw(I,level);
imshow(I)
figure
imshow(BW)
figure
imhist(I)

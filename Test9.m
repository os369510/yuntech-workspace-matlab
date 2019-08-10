close all;clear all;clc;
x=imread('Test_Image.jpg');
x=rgb2gray(x);
x = x(:)';
y=fft(x);
plot(abs(y));
figure
imshow(x);
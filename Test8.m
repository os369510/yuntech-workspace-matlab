close all;clear all;clc;
x=imread('6_new.bmp');
y=edge(x,'canny');
imshow(x)
figure;
imshow(y)
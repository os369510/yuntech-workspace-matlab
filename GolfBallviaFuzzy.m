close all;clear all;clc;
x=imread('º£¨í¶Ë.bmp');
y=sFuzzyRules3x3(x,3);
y=medfilt2(y,[3,3]);
y_canny=edge(x,'canny',[10 70]/255);
y_sobel=edge(x,'sobel',10/255);

figure('Name','Golf defect');
subplot(2,2,1);
imshow(x);title('Original');
subplot(2,2,2);
imshow(not(y));title('Fuzzy');
subplot(2,2,3);
imshow(y_canny);title('Canny');
subplot(2,2,4);
imshow(y_sobel);title('Sobel');

figure('Name','original');
imshow(x);title('Original');
figure('Name','fuzzy');
imshow(not(y));title('Fuzzy');
figure('Name','canny');
imshow(y_canny);title('Canny');
figure('Name','sobel');
imshow(y_sobel);title('Sobel');
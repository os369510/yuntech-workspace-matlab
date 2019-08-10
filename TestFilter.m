close all;clear all;clc;
% input=imread('blueBy8.bmp');
input=imread('sDoubleBy4.bmp');
input=medfilt2(input);
sizeX=size(input);
output=zeros(sizeX(1),sizeX(2));
for y=1:1:sizeX(1)
    for x=1:1:sizeX(2)
        output(y,x)=sCurve(input(y,x),8);
    end
end
imshow(output);
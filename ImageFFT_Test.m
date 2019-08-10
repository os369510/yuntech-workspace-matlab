close all;clear all;clc;
x=imread('calibration_grid.png');
x=rgb2gray(x);
x=x(1:294,:);
k=80;
y=fft2(x);
y=abs(y);
u=zeros(294,294);
for i = 1:294
    for j=1:294
        if( (i<k && j<k ) || (i<k && j>294-k) || ( i>294-k && j<k) || (i>294-k && j>294-k) )
            u(i,j)=1;
        end
    end
end
uu=ifft2(u);
output=conv2(uu,x);
g=y.*u;
yx=ifft2(g);

subplot(3,3,1);
imshow(x);
subplot(3,3,2);
imshow(y);
subplot(3,3,3);
imshow(u);
subplot(3,3,4);
imshow(output);
subplot(3,3,5);
imshow(abs(yx));
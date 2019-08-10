close all;clear all;clc;
% ninput=imread('Lena256gray.bmp');
% input=im2bw(ninput);
% output=ones(256:256);
ninput=imread('keyboard.jpg');
input=rgb2gray(ninput);
input=im2bw(input);
input_size=size(input);
output=ones(input_size(1,1),input_size(1,2));
mask=zeros(2:2);
for x=2:1:input_size(1,1)-1
    for y=2:1:input_size(1,2)-1
        mask(1,1)=input(x-1,y-1);
        mask(1,2)=input(x,y-1);
        mask(2,1)=input(x-1,y);
        mask(2,2)=input(x,y);
                
        if( (mask(1,1)==1 && mask(1,2)==1 && mask(2,1)==0 && mask(2,2)==0) || ...,
                (mask(1,1)==1 && mask(1,2)==0 && mask(2,1)==1 && mask(2,2)==0) || ...,
                (mask(1,1)==0 && mask(1,2)==1 && mask(2,1)==0 && mask(2,2)==1) || ...,
                (mask(1,1)==0 && mask(1,2)==0 && mask(2,1)==1 && mask(2,2)==1) )
            output(x,y)=0;
        end
    end
end
subplot(1,2,1);
imshow(ninput);
subplot(1,2,2);
imshow(output);
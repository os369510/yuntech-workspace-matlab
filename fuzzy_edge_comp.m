close all;clear all;clc;
input=imread('Lena256gray.bmp');
% input=im2bw(ninput);
% output=ones(256:256);
% ninput=imread('keyboard.jpg');
% input=rgb2gray(ninput);
input=im2bw(input);
input_size=size(input);
output1=zeros(input_size(1,1),input_size(1,2));
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
            output1(x,y)=1;
        end
    end
end

input=imread('Lena256gray.bmp');
% input=rgb2gray(ninput);
input_size=size(input);
output2=zeros(input_size(1,1),input_size(1,2));
mask=zeros(3:3);
for x=2:1:input_size(1,1)-1
    for y=2:1:input_size(1,2)-1
        % fulling mask
        mask(1,1)=input(x-1,y-1);
        mask(1,2)=input(x,y-1);
        mask(1,3)=input(x+1,y-1);
        
        mask(2,1)=input(x-1,y);
        mask(2,2)=input(x,y);
        mask(2,3)=input(x+1,y);
        
        mask(3,1)=input(x-1,y+1);
        mask(3,2)=input(x,y+1);
        mask(3,3)=input(x+1,y+1);
        % threshold
        for xm=1:1:3
            for ym=1:1:3
                flash=mask(ym,xm);
                mask(ym,xm)=(flash>(input(x,y)+20));
            end
        end
        %compare
        if( (mask(1,1)==1 && mask(1,2)==1 && mask(1,3)==1 && mask(2,1)==0 && mask(2,3)==0) || ...,       %// ¡Ç
                (mask(1,1)==1 && mask(1,2)==0 && mask(2,1)==1 && mask(3,1)==1 && mask(3,2)==0) || ...,   %// ¡Y
                (mask(2,1)==0 && mask(2,3)==0 && mask(3,1)==1 && mask(3,2)==1 && mask(3,3)==1) || ...,   %// ¡W
                (mask(1,2)==0 && mask(1,3)==1 && mask(2,3)==1 && mask(3,2)==0 && mask(3,3)==1) || ...,   %// ¡Ä
                (mask(1,1)==1 && mask(1,2)==1 && mask(2,1)==1 && mask(2,3)==0 && mask(3,2)==0) || ...,   %// ¢z
                (mask(1,2)==0 && mask(2,1)==1 && mask(2,3)==0 && mask(3,1)==1 && mask(3,2)==1) || ...,   %// ¢|
                (mask(1,2)==1 && mask(1,3)==1 && mask(2,1)==0 && mask(2,3)==1 && mask(3,2)==0) || ...,   %// ¢{
                (mask(1,2)==0 && mask(2,1)==0 && mask(2,3)==1 && mask(3,2)==1 && mask(3,3)==1) )         %// ¢}
            output2(x,y)=1;
        end
    end
end

input=imread('Lena256gray.bmp');
% input=rgb2gray(ninput);
output3=edge(input,'canny');

subplot(2,2,1);
imshow(input);
title('Original');
subplot(2,2,2);
imshow(output1);
title('PaperFuzzy');
subplot(2,2,3);
imshow(output2);
title('NewFuzzy');
subplot(2,2,4);
imshow(output3);
title('Canny');
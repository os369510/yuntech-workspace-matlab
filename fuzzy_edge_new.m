close all;clear all;clc;
% input=imread('Lena256gray.bmp');
input=imread('keyboard.jpg');
input=rgb2gray(input);
input_size=size(input);
output=ones(input_size(1,1),input_size(1,2));
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
                mask(ym,xm)=(flash>(input(x,y)+5));
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
            output(x,y)=0;
        end
    end
end
subplot(1,2,1);
imshow(input);
subplot(1,2,2);
imshow(output);
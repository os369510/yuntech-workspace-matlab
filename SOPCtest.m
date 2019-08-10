close all;clear all;clc;
% uinput=imread('Lena256gray.bmp');

uinput=imread('0701-10-1.bmp');
input=double(uinput);
input_size=size(input);
output=zeros(input_size(1),input_size(2));
kernel=[-1 -1 -1; 0 0 0 ; 1 1 1;];
for x=2:1:input_size(1)-1
    for y=2:1:input_size(2)-1
        output(x,y)=input(x-1,y-1)*kernel(1,1) + input(x-1,y+1)*kernel(3,1) +  ...,
        input(x,y-1)*kernel(1,2) +input(x,y+1)*kernel(3,2) +  ...,
        input(x+1,y-1)*kernel(1,3) +input(x+1,y+1)*kernel(3,3) ;
    end
end
input=uint8(input);
noutput=uint8(output);
subplot(2,2,1);
imshow(input);
subplot(2,2,2);
imshow(output);
subplot(2,2,3);
imshow(noutput);
subplot(2,2,4);
imshow(abs(output));





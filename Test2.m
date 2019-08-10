clc;clear all;
data=imread('pic1.bmp');
x=1:1:1024;
data=double(data);


data(1,x)=data(1,x).*0.002;

for i=2:500
    
    data(1,x)=data(1,x)+data(i,x).*0.002;
    
end
%data=uint(data);
%plot(x,data(1,x));
plot(x,data(1:length(x)));
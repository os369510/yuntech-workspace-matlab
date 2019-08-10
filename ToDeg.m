close all;clear all;clc;
n=0:0.01:1;
w=n.*100;
x1=5/2*sin(2*pi*n);
x2=5/2*cos(2*pi*n);
y=zeros(1,length(n));
for i=1:1:length(y)
    if(x1(i)>=0 && x2(i)>=0) % quadrant 1
        y(i)=atan(x1(i)./x2(i))*180/pi;
    end
    if(x2(i)<0) % quadrant 2 and 3
        y(i)=180+atan(x1(i)./x2(i))*180/pi;
    end
    if(x1(i)<0 && x2(i)>=0) % quadrant 4
        y(i)=360+atan(x1(i)./x2(i))*180/pi;
    end            
end
plot(w,y);
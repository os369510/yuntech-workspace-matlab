close all;clear all;clc;

% a=[0 128 192 224 240 248 252 254 255];
% b=linspace(0,255,length(a));
% values = spcrv([[a(1) a a(end)];[b(1) b b(end)]],3);
% plot(values(1,:),values(2,:), 'g');


x=0:1:255;
% y=exp(x*0.05);
% y=255*y/max(y)
% a=150;b=30;
% k1=b*x.^2-255*b.*x;
% k2=a^2-255*a;
% k3=x.^2-a.*x;
% k4=255-a;
% y=k1/k2+k3/k4;
y=zeros(1,255);
for i=1:1:256
    y(i)=sCurveImage(x(i),0.1);
end

plot(x,y);

%�Ȥ�ϵ���
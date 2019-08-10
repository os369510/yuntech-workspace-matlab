close all;clear all;clc;

figure('Name','Problem1');
A=1;
T=0.1;
d=T/10;
c0=((2/T)*(d/2-(-d/2)))/2;
Cn=zeros(1,201);

for n=-100:1:100
if(n == 0)Cn(n+101)=c0;
else Cn(n+101)=A*d/T*sin(n*pi*d/T)/(n*pi*d/T);
end
W(n+101)=n*1/T;
end

f=zeros(1,201);
for i=-100:1:100
    for k=-100:1:100
        f(i+101)=f(i+101)+Cn(k+101)*exp(j*k*2*pi/T*(i/100));
    end
    f(i+101)=real(fft(f(i+101)));
    t(i+101)=i/100;
end

%subplot(3,1,1),stem(f),axis('tight'), xlabel('Hz'), ylabel('value'),title('d=T/10')
plot(f)
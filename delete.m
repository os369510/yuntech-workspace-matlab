clear all;close all;clc;

N=50;
n=0:1:20;
x=linspace(0,4*pi,N);
y=zeros(1,N);

for k=1:1:N
    for i=0:1:length(n)-1
        y(k)=y(k) + ((-1)^i) * (x(k)^(2*i+1)) / factorial(2*i+1);
    end
end

figure('Name','Lab01')

subplot(1,2,1);
stem(x/pi,y);
title('sine signal (stem)');xlabel('\pi');ylabel('value');
legend('sin signal');
axis tight;

subplot(1,2,2);
plot(x/pi,y);
title('sine signal (plot)');xlabel('\pi');ylabel('value');
legend('sin signal');
grid on;
axis tight;
close all;clear all;clc;

figure;
n=[1:1:200];
y1=cos(pi/10*n)+2*sin(pi*(0.3)*n);
subplot(5,1,1);	
plot(n,y1);
xlabel('n');
ylabel('x(n)');
grid on 
title('2.a');

y2=cos(pi/10*n)+2*cos(pi*0.3*n);
subplot(5,1,2);
plot(n,y2);
xlabel('n');
ylabel('x(n)');
grid on 
title('2.b');

y3=3*cos(pi*0.1*n+pi/3)+1.5*sin(pi*0.5*n);
subplot(5,1,3);
plot(n,y3);
xlabel('n');
ylabel('x(n)');
grid on 
title('2.c');

y4=3*cos(0.4*n+pi/3)+1.5*sin(0.5*n);
subplot(5,1,4);
plot(n,y4);
xlabel('n');
ylabel('x(n)');
grid on 
title('2.d');

y5= cos(0.11*pi*n);
subplot(5,1,5);
plot(n,y5);
xlabel('n');
ylabel('x(n)');
grid on 
title('2.e');

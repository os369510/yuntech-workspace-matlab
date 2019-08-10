% close all;
% clear all;clc;
figure('Name','Question 3-(b)') ;
p=pi;
n=0:1:199;
x0=cos(.1*p.*n)+2*sin(.3*p.*n);
x2=3*cos(.1*p.*n+p/3)+1.5*sin(.5*p.*n);
x4=cos(.11*p.*n);
x0=x0+.1*randn(1,length(x0));
x2=x2+.1*randn(1,length(x2));
x4=x4+.1*randn(1,length(x4));
% plot(n,x0,'r-',n,x1,'b-',n,x2,'g-',n,x3,'c-',n,x4,'k-');
% title('Lab03-2');
% legend('x[0]','x[1]','x[2]','x[3]','x[4]');
subplot(3,1,1)
plot(n,x0);
title('(a)');
xlabel('Sample sequences');ylabel('Value');
subplot(3,1,2)
plot(n,x2);
title('(c)');
xlabel('Sample sequences');ylabel('Value');
subplot(3,1,3)
plot(n,x4);
title('(e)');
xlabel('Sample sequences');ylabel('Value');
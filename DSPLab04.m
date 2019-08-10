close all;clear all;clc;
%% %% Question 1
%% Def.
N=200;
n=0:1:N-1;
x1=0.1*randn(1,N);
x2=sin(n*pi/4);
input=x1+x2;
y1=zeros(1,N);
y2=zeros(1,N);
%% Compute
for i=1:1:N 
    if i==1
        y1(i)=.5*input(i);
        y2(i)=input(i);
    elseif i==2
        y1(i)=-.8*y1(i-1)+.5*input(i)-.3*input(i-1);
        y2(i)=input(i)+0.4*input(i-1);
    elseif i>2
        y1(i)=-.8*y1(i-1)+.5*input(i)-.3*input(i-1);
        y2(i)=input(i)+0.4*input(i-1)+.16*input(i-2);        
    end
end
%% Plot
figure('Name','Question 1');
subplot(3,2,1);
stem(x1);
title('x1');xlabel('n');ylabel('value');
subplot(3,2,2);
stem(x2)
title('x2');xlabel('n');ylabel('value');
subplot(3,2,3);
stem(input);
title('input(x1+x2)');xlabel('n');ylabel('value');
subplot(3,2,4);
stem(y1);
title('Output(system 1)');xlabel('n');ylabel('value');
subplot(3,2,5);
stem(y2);
title('Output(system 2)');xlabel('n');ylabel('value');

%% %% Question 2
%% Def.
n=0:12;
N=length(n);
x=(-0.7).^n;
y=zeros(1,N);
%% Compute
for i=1:1:N
    switch i
        case 1
            y(i)=x(i);
        case 2
            y(i)=x(i)-.5*x(i-1)-.9*y(i-1);
        case 3
            y(i)=x(i)-.5*x(i-1)+.3*x(i-2)-.9*y(i-1);
        otherwise
            y(i)=x(i)-.5*x(i-1)+.3*x(i-2)-.9*y(i-1)+.4*y(i-3);
    end            
end
%% Plot
figure('Name','Question 2')
subplot(2,1,1);
plot(n,x);
title('input(x)');xlabel('n');ylabel('value');axis tight;
subplot(2,1,2);
plot(n,y);
title('Output(y)');xlabel('n');ylabel('value');axis tight;

%% %% Question 3
%% Def. 
b=[1 -.5 .3];
a=[1 .9 0 -.4];
%% Compute
y=filter(b,a,x);
%% Plot
figure('Name','Question 3');
subplot(2,1,1)
plot(n,x);
title('input(x)');xlabel('n');ylabel('value');axis tight;
subplot(2,1,2);
plot(n,y);
title('Output(y)');xlabel('n');ylabel('value');axis tight;

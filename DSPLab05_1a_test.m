close all;clear all;clc;
% xn=[-2  4   3   -6  5   -1  8];%x[n]¡±??C??
xn=-40:40;
nStarting=-16;%¢X_?ln??
L=length(xn);
n=[nStarting:nStarting+L-1];
x=[xn;n];
M=4;%?jM??????
 
y=dnsample1(x,M);
yn=y(2,:);
y=y(1,:);
 
figure('name','Question 1-(a)')
subplot(2,1,1);
stem(n,xn);
axis tight;
xlabel('n');ylabel('x[n]');
subplot(2,1,2);
stem(yn,y);
axis tight;
xlabel('n');ylabel('y[n]');

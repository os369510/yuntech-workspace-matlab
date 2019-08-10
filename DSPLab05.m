close all;clear all;clc;
%% %% Question 1
%% Def.
x=-50:1:50;
M=5;
index=25;
%% Compute
[y,Index,xPoint,yPoint]=dnsample(x,M,index);
%% Plot
figure('Name','Question 1-a');
subplot(2,1,1);
stem(xPoint,x);xlabel('n');ylabel('value');axis tight;
subplot(2,1,2);
stem(yPoint,y);xlabel('n');ylabel('value');axis tight;

%% Def.
n=-50:1:50;
x=sin(.125*pi.*n);
M=4;
index=51;
%% Compute
[y,Index,xPoint,yPoint]=dnsample(x,M,index);
%% Plot
figure('Name','Question 1-b');
subplot(2,1,1);
stem(xPoint,x);xlabel('n');ylabel('value');axis tight;
subplot(2,1,2);
stem(yPoint,y);xlabel('n');ylabel('value');axis tight;

%% Def.
n=-50:1:50;
x=sin(.5*pi.*n);
M=4;
index=51;
%% Compute
[y,Index,xPoint,yPoint]=dnsample(x,M,index);
%% Plot
figure('Name','Question 1-c');
subplot(2,1,1);
stem(xPoint,x);xlabel('n');ylabel('value');axis tight;
subplot(2,1,2);
stem(yPoint,y);xlabel('n');ylabel('value');axis tight;

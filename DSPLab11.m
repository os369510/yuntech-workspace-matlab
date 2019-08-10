close all;clear all;clc;
%% Question 1
figure('Name','Question 1');
%% Def.
N=1:2048;
time=zeros(1,length(N));
%% Compute
for i=1:length(N)
    x=rand(1,i);
    tic
    y=fft(x,i);
    time(i)=toc;
end
%% plot
plot(N,time);title('processing time');xlabel('N');ylabel('time(ms)');axis tight;

%% Question 2
clear all;clc;
figure('Name','Question 2');
%% Def.
N=[80 128 240 512];
zpN2=2048;
Fs=4e3;
f=7e2;
Ts=1/Fs;
%% Compute
for i=1:1:length(N)
    t=0:Ts:(N(i)-1)*Ts;
    x=sin(2*pi*f.*t);
    zpx=[x zeros(1,N(i)-zpN2)];
    y=abs(fft(x,N(i)));
    zpy=abs(fft(zpx,zpN2));
    w=linspace(0,Fs,length(y));
    zpw=linspace(0,Fs,length(zpy));
    %% Plot
    subplot(2,4,i);
    plot(w,y);title(['N= ',int2str(N(i)),', Spectra']);xlabel('f');ylabel('magnitude');axis tight;
    subplot(2,4,i+length(N));
    plot(zpw,zpy);title(['N= ',int2str(N(i)),' (zeros-padding) of Spectra']);xlabel('f');ylabel('magnitude');axis tight;
end

%% Question 3
clear all;clc;
figure('Name','Question 3');
%% Def.
Fs=[500 1500];
N=256;
for i=1:1:length(Fs)
    t=0:1/Fs(i):(N-1)/Fs(i);
    x=cos(240*pi.*t)+cos(320*pi.*t)+cos(420*pi.*t)+cos(720*pi.*t);
    y=abs(DFTByMatrix(x,N));
    w=linspace(0,Fs(i),length(y));
    %% Plot
    subplot(2,1,i);
    plot(w,y);title(['n=256, Fs=',int2str(Fs(i)),', Spectra']);xlabel('f');ylabel('magnitude');axis tight;
end

%% Question 4
clear all;clc;
figure('Name','Question 4');
%% Def.
Fs=1500;
N=[512 1024 2048 4096];
zpN=7000;
for i=1:1:length(N)
    t=0:1/Fs:(N(i)-1)/Fs;
    x=cos(240*pi.*t)+cos(320*pi.*t)+cos(420*pi.*t)+cos(720*pi.*t);
    zpx=[x zeros(1,N(i)-zpN)];
    y=abs(DFTByMatrix(x,N(i)));
    zpy=abs(DFTByMatrix(zpx,zpN));
    w=linspace(0,Fs,length(y));
    zpw=linspace(0,Fs,length(zpy));
    %% Plot
    subplot(2,4,i);
    plot(w,y);title(['N= ',int2str(N(i)),', Spectra']);xlabel('f');ylabel('magnitude');axis tight;
    subplot(2,4,i+length(N));
    plot(zpw,zpy);title(['N= ',int2str(N(i)),' (zeros-padding) of Spectra']);xlabel('f');ylabel('magnitude');axis tight;
end
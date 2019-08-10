%% Question 1
close all;clear all;clc;
figure('Name','Question 1');
%% Define
a1=[1 0.5 -0.25];
b1=[1 0.5];
a2=[1 0.5 -0.25];
b2=[1 0.5];
a3=[1 0.5 -0.25];
b3=[1 0.5];
N=10240;
%% Compute
for i=1:1:3
    switch(i)
        case 1
            a=a1;
            b=b1;
        case 2
            a=a2;
            b=b2;
        case 3
            a=a3;
            b=b3;
    end
    [H,w]=freqz(b,a);
    subplot(3,4,(i-1)*4+1);
    title(['system ',int2str(i),' in z-plane']);
    zplane(b,a);
    subplot(3,4,(i-1)*4+2);
    subplot(3,4,(i-1)*4+3);
    plot(w/pi,20*log10(abs(H)));
    title(['magnitude response of system ',int2str(i),'.']);xlabel('Nor. freq.');ylabel('value(dB)');axis tight;
    subplot(3,4,i*4);
    plot(w/pi,180*phase(H)/pi);
    title(['phase response of system ',int2str(i),'.']);xlabel('Nor. freq.');ylabel('degree');axis tight;
end

%% Question 2
close all;clear all;clc;
figure('Name','Question 2');
%% Define
hb=[0 0 1];
ha=[1 1.7 0.7625];
gb=[1 0 1];
ga=conv([1 -0.5],[1 -.25]);
%% Compute
[Rh,ph,Ch]=residuez(hb,ha);
[Rg,pg,Cg]=residuez(gb,ga);
Rh,Rg  % for compute zero
ph,pg  % for compute pole
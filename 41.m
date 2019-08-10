close all;clear all;clc;
R=1e6; % ohm , (b)R=10M ohm,
C=1e-6; % F  ,       and C=0.3uF
R=3*1e3;
C=.1*1e-6;
tial=1/(R*C);
t=linspace(0,5*tial,1000);
om=linspace(0,tial,1000);
%%
ir=( 1 / (R*C) ) * exp(-t./(R*C));
fr=( 1 / (R*C) ) ./ ( om + ( 1 / (R*C) ));
%% plot
subplot(1,3,1);
plot(ir);
subplot(1,3,2);
plot(fr);
subplot(1,3,3);
plot(abs(fft(ir)));
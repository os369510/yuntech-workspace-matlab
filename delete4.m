close all;clear all;clc;
%% Def. Contants 
R=1e6;                      % 1M ohm 
% R=1e7;                    % another case ; 10M ohm
C=1e-6;                     % 1uF
% C=0.3*1e-6;               % another case ; 0.3uF
L=1000;                     % lenght of sequence
fmax=1;                     % frequency (maximum)
tauon=R*C;                  % time constants (tauon)
fcut=1/(2*pi*tauon)         % cutoff frequency
t=linspace(0,5*tauon,L);    % time sequence
f=linspace(0,fmax,L);       % frequency sequence
%% Compute
ir=( 1 / (R*C) ) * exp(-t./tauon);  % impulse response
fr=1 ./ ((j*tauon*2*pi.*f)+1);      % frequency response
%% Plot
figure('Name','Question 4-(a)');
subplot(1,2,1);
plot(t,ir);
title('Impulse response');xlabel('time');ylabel('Value');
subplot(1,2,2);
plot(f,abs(fr));
title('Frequency response');xlabel('frequency');ylabel('Gain');
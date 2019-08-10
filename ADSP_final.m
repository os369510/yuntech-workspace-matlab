close all;clear all;clc;
%initial setting
x=wavread('DTMF_Signal.wav');
ToneNumber=7; % Syllable number
ToneLength=length(x)/ToneNumber; % Syllable length
fs=8000; %sample frequency
N=[140,205,300]; % set N
for i=1:1:ToneNumber
    x_Cut=x( (((i-1)*ToneLength)+1):i*ToneLength ); %cut x
    figure
    for k=1:1:length(N)
        X=abs(fft(x_Cut,N(k))); % fft
        w=linspace(0,fs,length(X));
        plot(w,X);
        title(['Number "',num2str(i),'" signal , Use (7*N)-point FFT , N=[140,205,300]']);
        axis tight;xlabel('frequency');ylabel('value');
        hold on;
    end
end
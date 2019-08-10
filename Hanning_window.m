function [sh_window_n,sh_freq_n,Wn_window,Wn_FFT]=Hanning_window(N_length,N_precision);
%//////////////////////////////////////////////////////
%Input:
%N_length and N_precision
%N_length is window's length
%N_precision is window's FFT's precision 
%
%Return:
%sh_window_n is window's length shift
%sh_freq_n is window's FFT's precision shift
%Wn_window is window in time domain
%Wn_FFT is window in frequency domain
%//////////////////////////////////////////////////////
sh_window_n=(0:N_length-1);
sh_freq_n=linspace(0,2*pi,N_precision);
Wn_FFT=zeros(1,N_length);
Wn_freq=zeros(1,N_precision);
Wn_window=zeros(1,N_length);
for i=1:1:N_length
    Wn_window(i)=(1/2)-(1/2)*cos(2*pi*(i-1)/(N_length-1));
end
Wn_FFT=FFT_su(Wn_window,N_precision);
Wn_FFT=db(Wn_FFT);

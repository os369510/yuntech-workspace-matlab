function [sh_window_m,sh_freq_m,Wm_window,Wm_FFT]=Hamming_window(N_length,N_precision);
%//////////////////////////////////////////////////////
%Input:
%N_length and N_precision
%N_length is window's length
%N_precision is window's FFT's precision 
%
%Return:
%sh_window_m is window's length shift
%sh_freq_m is window's FFT's precision shift
%Wm_window is window in time domain
%Wm_FFT is window in frequency domain
%//////////////////////////////////////////////////////
sh_window_m=(0:N_length-1);
sh_freq_m=linspace(0,2*pi,N_precision);
Wm_FFT=zeros(1,N_length);
Wm_freq=zeros(1,N_precision);
Wm_window=zeros(1,N_length);
for i=1:1:N_length
    Wm_window(i)=0.54-0.46*cos(2*pi*(i-1)/(N_length-1));
end
Wm_FFT=FFT_su(Wm_window,N_precision);
Wm_FFT=db(Wm_FFT);
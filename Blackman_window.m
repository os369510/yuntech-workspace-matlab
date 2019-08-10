function [sh_window_l,sh_freq_l,Wl_window,Wl_FFT]=Blackman_window(N_length,N_precision);
%//////////////////////////////////////////////////////
%Input:
%N_length and N_precision
%N_length is window's length
%N_precision is window's FFT's precision 
%
%Return:
%sh_window_l is window's length shift
%sh_freq_l is window's FFT's precision shift
%Wl_window is window in time domain
%Wl_FFT is window in frequency domain
%//////////////////////////////////////////////////////
sh_window_l=(0:N_length-1);
sh_freq_l=linspace(0,2*pi,N_precision);
Wl_FFT=zeros(1,N_length);
Wl_freq=zeros(1,N_precision);
Wl_window=zeros(1,N_length);
for i=1:1:N_length
    Wl_window(i)=(0.42)-((1/2)*cos(2*pi*(i-1)/(N_length-1)))+(0.08*cos(4*pi*(i-1)/(N_length-1)));
end
Wl_FFT=FFT_su(Wl_window,N_precision);
Wl_FFT=db(Wl_FFT);
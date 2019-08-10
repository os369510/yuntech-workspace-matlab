function [sh_window_r,sh_freq_r,Wr_window,Wr_FFT]=Rectangular_window(N_length,N_precision);
%//////////////////////////////////////////////////////
%Input:
%N_length and N_precision
%N_length is window's length
%N_precision is window's FFT's precision 
%
%Return:
%sh_window_r is window's length shift
%sh_freq_r is window's FFT's precision shift
%Wr_window is window in time domain
%Wr_FFT is window in frequency domain
%//////////////////////////////////////////////////////
sh_window_r=(0:N_length-1);
sh_freq_r=linspace(0,2*pi,N_precision);
Wr_window=ones(1,N_length);
Wr_FFT=zeros(1,N_length);
Wr_freq=zeros(1,N_precision);
Wr_FFT=FFT_su(Wr_window,N_precision);
Wr_FFT=db(Wr_FFT);
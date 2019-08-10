function [sh_window_b,sh_freq_b,Wb_window,Wb_FFT]=Bartlett_window(N_length,N_precision);
%//////////////////////////////////////////////////////
%Input:
%N_length and N_precision
%N_length is window's length
%N_precision is window's FFT's precision 
%
%Return:
%sh_window_b is window's length shift
%sh_freq_b is window's FFT's precision shift
%Wb_window is window in time domain
%Wb_FFT is window in frequency domain
%//////////////////////////////////////////////////////
sh_window_b=(0:N_length-1);
sh_freq_b=linspace(0,2*pi,N_precision);
Wb_FFT=zeros(1,N_length);
Wb_freq=zeros(1,N_precision);
Wb_window=zeros(1,N_length);
for i=1:1:((N_length+1)/2)
    Wb_window(i)=2*(i-1)/(N_length-1);
end
for i=((N_length+1)/2):1:N_length
    Wb_window(i)=(2-(2*(i-1)/(N_length-1)));
end
Wb_FFT=FFT_su(Wb_window,N_precision);
Wb_FFT=db(Wb_FFT);
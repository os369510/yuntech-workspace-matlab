fs=1e5;
B=fir1(63,2.5/(fs/2));
plot((0:25)*fs/26,abs(fft(B)));

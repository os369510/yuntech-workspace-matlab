figure('Name','Problem2');
x=[1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
X=Fast_Fourier_Transform(x);
X2=fft(x);
subplot(1,2,1),plot(abs(X)),axis('tight'), xlabel('n'), ylabel('X[n]'),title('FFT by myself')
subplot(1,2,2),plot(abs(X2)),axis('tight'), xlabel('n'), ylabel('X[n]'),title('FFT by function')

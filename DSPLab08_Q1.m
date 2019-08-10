clear all;clc;
figure('Name','Question 1');
%% Def.
f1=800;f2=500;f3=250;
sec=0.1;
t1=0:1/f1:sec;
t2=0:1/f2:sec;
t3=0:1/f3:sec;
N=1024;
for i=1:1:3
    %% Conpute
  switch i
      case 1
          t=t1;
          f=f1;
      case 2
          t=t2;
          f=f2;
      case 3
          t=t3;
          f=f3;
  end
  w=linspace(0,f,N);
  x=sin(2*pi*100*t)+sin(2*pi*150*t)+sin(2*pi*300*t);
  y=abs(fft(x,N));          
    %% Plot
    subplot(2,3,i);
    plot(t,x);title(['time domain of sample frequency : ',int2str(f),' (Hz)']);xlabel('time');ylabel('value');axis tight;
    subplot(2,3,i+3);
    plot(w,y);title(['freq. domain of sample frequency : ',int2str(f),' (Hz)']);xlabel('frequency');ylabel('magnitude');axis tight;
end
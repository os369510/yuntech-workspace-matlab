clear all;clc;
figure('Name','Question 2');
%% Def.
f=3000;
sec=0.1;
t=0:1/f:sec;
N=length(t)*10;
for i=1:1:3
    %% Conpute
  w=linspace(0,f,N);
  x=sin(2*pi*100*t)+sin(2*pi*150*t)+sin(2*pi*300*t);
  switch i
      case 1
      case 2
          x=dnsample(x,3,1);
      case 3
          x=dnsample(x,3,1);
          x=interpolation_2(x);
  end
  y=abs(fft(x,N));
  tw=linspace(0,sec,length(x));
    %% Plot
    subplot(2,3,i);
    plot(tw,x);title(['time domain of case ',int2str(i)]);xlabel('time');ylabel('value');axis tight;
    subplot(2,3,i+3);
    plot(w,y);title(['freq. domain of case ',int2str(i)]);xlabel('frequency');ylabel('magnitude');axis tight;
end
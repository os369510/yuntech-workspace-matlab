close all;clear all;clc;

figure('Name','Lab06-Question 1')
for mode=1:1:3
    
%% Def.
T=0.1;
switch mode
    case 1
        k=10;
    case 2 
        k=50;
    case 3
        k=100;
end
d=T/k;
A=1;
n=1:1000;
Ts=T/500;
Fs=1/Ts;
%% Compute
t=-0.5*T:Ts:0.5*T;
f=linspace(0,Fs,length(t));

a0=(2/T)*( (d/2) - (-d/2) ) ;
an=( (2/T)./(2*pi*n/T) ) .* (sin(2*pi*n*(d/2)/T) - sin(2*pi*n*(-d/2)/T));
bn=( (2/T)./(2*pi*n/T) ) .* (-cos(2*pi*n*(d/2)/T) - (-cos(2*pi*n*(-d/2)/T)) );
cn=(d/T) * ( sin(n*pi*(d/T)) ./ (n*pi*(d/T)) ) ;
    
fOfx=zeros(1,length(t));
for i=1:1:length(fOfx)
    for k=1:1:length(n)
        fOfx(i)=fOfx(i)+cn(k)*exp(j*n(k)*(2*pi/T)*t(i));
    end
end
    
fOfxByab=zeros(1,length(t));
for i=1:1:length(fOfxByab)
    aSum=0;
    bSum=0;
    for k=1:1:length(n)
        aSum=aSum+an(k)*cos(k*(2*pi/T)*t(i));
        bSum=bSum+bn(k)*sin(k*(2*pi/T)*t(i));
    end
    fOfxByab(i)=aSum+bSum;
end
fOfxByab=fOfxByab+a0/2;
    
%% Plot
subplot(2,3,mode);
plot(t,fOfxByab)
xlabel('t');ylabel('value');axis tight;
switch mode
    case 1
        title('d=T/10');
    case 2
        title('d=T/50');
    case 3
        title('d=T/100');
end
subplot(2,3,mode+3);
plot(f,abs(fft(fOfxByab)))
xlabel('f');ylabel('magnitude');title('freq. domain');axis tight;

end

figure('Name','Lab06-Question 3')
for mode=1:1:6
    
%% Def.
T=0.1;
d=0.01;
A=1;
switch mode
    case 1
        n=1:5;
    case 2
        n=1:10;
    case 3
        n=1:15;
    case 4
        n=1:20;
    case 5
        n=1:30;
    case 6
        n=1:100;
end
Ts=T/500;
Fs=1/Ts;
%% Compute
t=-0.5*T:Ts:0.5*T;

a0=(2/T)*( (d/2) - (-d/2) ) ;
an=( (2/T)./(2*pi*n/T) ) .* (sin(2*pi*n*(d/2)/T) - sin(2*pi*n*(-d/2)/T));
bn=( (2/T)./(2*pi*n/T) ) .* (-cos(2*pi*n*(d/2)/T) - (-cos(2*pi*n*(-d/2)/T)) );
cn=(d/T) * ( sin(n*pi*(d/T)) ./ (n*pi*(d/T)) ) ;
    
fOfx=zeros(1,length(t));
for i=1:1:length(fOfx)
    for k=1:1:length(n)
        fOfx(i)=fOfx(i)+cn(k)*exp(j*n(k)*(2*pi/T)*t(i));
    end
end
    
fOfxByab=zeros(1,length(t));
for i=1:1:length(fOfxByab)
    aSum=0;
    bSum=0;
    for k=1:1:length(n)
        aSum=aSum+an(k)*cos(k*(2*pi/T)*t(i));
        bSum=bSum+bn(k)*sin(k*(2*pi/T)*t(i));
    end
    fOfxByab(i)=aSum+bSum;
end
fOfxByab=fOfxByab+a0/2;
    
%% Plot
subplot(2,3,mode);
plot(t,fOfxByab)
xlabel('t');ylabel('value');axis tight;
switch mode
    case 1
        title('n = 5');
    case 2
        title('n = 10');
    case 3
        title('n = 15');
    case 4
        title('n = 20');
    case 5
        title('n = 30');
    case 6
        title('n = 100');
end

end
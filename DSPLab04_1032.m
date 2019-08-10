%% // DSP lab 04
close all;clear all;clc;
x=wgn(1,500,0);
figure('Name','Gaussian noise');
subplot(1,2,1);
plot(x);axis tight;title('Time domain');
subplot(1,2,2);
plot(abs(fft(x)));axis tight;title('Freq. domain');

b=[5 11.2 5.44 -0.384 -2.3552 -1.2288];
a=[1 0.8 0 -0.512 -0.4096];

bt=[1 -3 11 -27 18];
at=[16 12 2 -4 -1];

[b0,Bc,Ac]=dir2cas(b,a);
[C,Bp,Ap]=dir2par(b,a);

%% Question 2.
figure('Name','Question 2');
y=casfilter(b0,Bc,Ac,x);
subplot(2,2,1);
plot(x);axis tight;title('input in time domain');
subplot(2,2,3);
plot(abs(fft(x)));axis tight;title('input in freq. domain');
subplot(2,2,2);
plot(y);axis tight;title('output in time domain');
subplot(2,2,4);
plot(abs(fft(y)));axis tight;title('output in freq. domain');

%% Question 3.
figure('Name','Question 3');
y=parfilter(C,Bp,Ap,x);
subplot(2,2,1);
plot(x);axis tight;title('input in time domain');
subplot(2,2,3);
plot(abs(fft(x)));axis tight;title('input in freq. domain');
subplot(2,2,2);
plot(y);axis tight;title('output in time domain');
subplot(2,2,4);
plot(abs(fft(y)));axis tight;title('output in freq. domain');

%% Question 4.
figure('Name','Question 4');
y=dirfilter(b,a,x);
subplot(2,2,1);
plot(x);axis tight;title('input in time domain');
subplot(2,2,3);
plot(abs(fft(x)));axis tight;title('input in freq. domain');
subplot(2,2,2);
plot(y);axis tight;title('output in time domain');
subplot(2,2,4);
plot(abs(fft(y)));axis tight;title('output in freq. domain');

%% Question 5.
figure('Name','Question 5. eq.1 freq. response');
[Hf,w]=freqz(b,a);
plot(w,abs(Hf));title('matitude response');axis tight;
figure('Name','Question 5, subfilter of casfilter');
sizeAc=size(Ac);
sizeBc=size(Bc);
Htotal=ones(1,length(Hf));
for i=1:1:sizeAc(1)+1
    subplot(1,sizeAc(1)+1,i);
    if i~=sizeAc(1)+1
        [H,w]=freqz(Bc(i,:),Ac(i,:));
        plot(w,abs(H));axis tight;title(['sub ',int2str(i),' freq. response']);
        Htotal = Htotal.*H';
    else
        Htotal = Htotal * b0;
        plot(w,abs(Htotal));axis tight;title(['sum freq. response']);
    end
end
figure('Name','Question 6, subfilter of parfilter');
sizeAp=size(Ap);
sizeBp=size(Bp);
Htotal=zeros(1,length(Hf));
for i=1:1:sizeAp(1)+1
    subplot(1,sizeAp(1)+1,i);
    if i~=sizeAp(1)+1
        [H,w]=freqz(Bp(i,:),Ap(i,:));
        plot(w,abs(H));axis tight;title(['sub ',int2str(i),' freq. response']);
        Htotal = Htotal + abs(H)';
    else
        [H,w]=freqz(C,1);
        Htotal = Htotal + abs(H');
        plot(w,Htotal);axis tight;title(['sum freq. response']);
    end
end
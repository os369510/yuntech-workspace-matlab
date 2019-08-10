%% DSP 103-2 Lab05
close all;
%% // Question 1
figure('Name','Question 1');
clear all;clc;
%% Define
b=[5 11.2 5.44 -0.384 -2.3552 -1.2288];
a=[1 0.8 0 -0.512 -0.4096];
%% Compute
[H1,w]=freqz(b,a,1024);
[H2]=freqresp(b,a,w);
%% Plot
subplot(1,2,1);
plot(w/pi,abs(H1));title('from freqz');xlabel('norm. w(0~\pi)');ylabel('amplitude');axis tight;
subplot(1,2,2);
plot(w/pi,abs(H2));title('from my function');xlabel('norm. w(0~\pi)');ylabel('amplitude');axis tight;

%% // Question 2
figure('Name','Question 2');
clear all;clc;
%% Define
h1=[-3,-1,2,4,2,-1,-3];
h2=[-3 -1 2 4 4 2 -1 -3];
h3=[-3 -1 2 0 -2 1 3] ;
h4=[-3 -1 2 4 -4 -2 1 3];
omg=linspace(-pi,pi,256);
L=length(omg);
%% Compute
for i=1:1:4
    H=zeros(1,length(omg));
    switch(i)
        case 1
            M=length(h1);
            a=zeros(1,((M-3)/2)+2);
            a(1)=h1((M-1)/2+1);
            for p=2:1:(M-3)/2+2
                a(p)=2*h1((M-1)/2 - p + 2 );
            end
            for o=1:1:L
                for k=0:1:(M-1)/2
                    H(o)=H(o)+a(k+1)*cos(omg(o)*k);
                end
            end
        case 2
            M=length(h2);
            b=zeros(1,M/2);
            for p=1:1:M/2
                b(p)=2*h2((M/2)-(p-1));
            end
            for o=1:1:L
                for k=1:1:M/2
                    H(o)=H(o)+b(k)*cos(omg(o)*(k-0.5));
                end
            end
        case 3
            M=length(h3);
            c=zeros(1,(M-1)/2+1);
            for p=1:1:(M-1)/2+1
                c(p)=2*h3((M-1)/2 -(p-2));
            end
            for o=1:1:L
                for k=1:1:(M-1)/2+1
                    H(o)=H(o)+c(k)*sin(omg(o)*(k-1));
                end
            end
        case 4
            M=length(h4);
            d=zeros(1,M/2);
            for p=1:1:M/2
                d(p)=2*h4(M/2 - (p-1));
            end
            for o=1:1:L
                for k=1:1:M/2
                    H(o)=H(o)+d(k)*sin(omg(o)*(k-0.5));
                end
            end
    end
    subplot(2,2,i);
    plot(omg/pi,real(H));title(['type ',int2str(i)]);xlabel('\Omega (\pi)');ylabel('amplitude');axis tight;grid on;
end
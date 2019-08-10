close all;clear all;clc;
%% %% Question 1 and 2
figure('Name','Question 1 and 2');
%% Def.
N1=45;
N2=100;
N3=100;
M=4;
%% Compute
n1=0:N1-1;
x1=0.95.^n1;
x2=[x1 zeros(1,N2-N1)];
x3=x2;
X1=DFTByMatrix(x1,N1);
x1byX1=IDFTByMatrix(X1,N1);
X2=DFTByMatrix(x2,N2);
x2byX2=IDFTByMatrix(X2,N2);
X3=X2;
[X3,Index,xPoint,yP]=dnsample(X3,M,1);
N3=length(X3);
x3byX3=IDFTByMatrix(X3,N3);

w1=0:length(x1)-1;
W1=linspace(0,1,length(X1));
w2=0:length(x2)-1;
W2=linspace(0,1,length(X2));
w3=0:length(x3)-1;
W3=linspace(0,1,length(X3));
%% Plot
subplot(3,3,1);
stem(w1,x1):title('(a),N=45 time domain');xlabel('n');ylabel('value');axis tight;
subplot(3,3,2);
stem(W1,abs(X1)):title('(a),N=45 freq. domain via abs');xlabel('w(normalize)');ylabel('magnitude');axis tight;
subplot(3,3,3);
stem(w1,abs(x1byX1)):title('(b),N=45 time domain use IDFT');xlabel('n');ylabel('value');axis tight;

subplot(3,3,4);
stem(w2,x2):title('(a),N=100 time domain');xlabel('n');ylabel('value');axis tight;
subplot(3,3,5);
stem(W2,abs(X2)):title('(a),N=100 freq. domain via abs');xlabel('w(normalize)');ylabel('magnitude');axis tight;
subplot(3,3,6);
stem(w2,abs(x2byX2)):title('(b),N=100 time domain use IDFT');xlabel('n');ylabel('value');axis tight;

subplot(3,3,7);
stem(w3,x3):title('(c),N=100 time domain');xlabel('n');ylabel('value');axis tight;
subplot(3,3,8);
stem(W3,abs(X3)):title(['(c),N=100 freq. domain via abs,decimate(MM=',int2str(M),')']);xlabel('w(normalize)');ylabel('magnitude');axis tight;
subplot(3,3,9);
stem(abs(x3byX3)):title(['(c),N=100 time domain use IDFT via decimate(M=',int2str(M),')']);xlabel('n');ylabel('value');axis tight;

%% %% Question 3
clear all;clc;
figure('Name','Question 3');
%% Def.
N=[8, 16, 32, 128 ];
%% Compute 
x=[ones(1,8)]
Lofx=length(x);
for i=1:1:length(N)
    x=[x zeros(1,N(i)-Lofx)];
    [Xk]=DFTByMatrix(x,N(i))
    
    W=linspace(0,1,length(Xk));
    %% Plot
    subplot(2,2,i);
    stem(W,Xk);title(['zero-padding to ',int2str(N(i)),', freq. domain']);xlabel('w(normalize)');ylabel('magnitude');axis tight;
end

%% %% Question 4
clear all;clc;
figure('Name','Question 4');
%% Def.
Lofxn=20;
%% Compute
N=[Lofxn Lofxn*2 Lofxn*3];

n=0:N(1)-1;
xn=(1/2).^n;

hn=ones(1,5);
Lofhn=length(hn);
for i=1:1:length(N)
    
    hn=[hn zeros(1,N(i)-Lofhn)];
    xn=[xn zeros(1,N(i)-Lofxn)];
    y=conv(hn,xn);
    
    H=DFTByMatrix(hn,N(i));
    X=DFTByMatrix(xn,N(i));
    Y=DFTByMatrix(y,N(i));
    
    W1=linspace(0,1,length(Y));
    W2=linspace(0,1,length(H));
    
    subplot(3,2,i*2-1);
    plot(W1,abs(Y));title(['N=',int2str(N(i)),',via abs from conv.']);xlabel('w(normalize');ylabel('magnitude');axis tight;
    subplot(3,2,i*2);
    plot(W2,abs(H.*X));title(['N=',int2str(N(i)),',via abs from H*X']);xlabel('w(normalize');ylabel('magnitude');axis tight;
end

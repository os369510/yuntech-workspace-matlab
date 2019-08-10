clc;
clear all;close all;
[x1,fs,nbits]=wavread('welcome.wav');
x1=x1';
G=length(x1);
noiseK=0.25;
Noise=noiseK*rand(1,G);
x=x1+Noise;
h=fspecial('gaussian',[1,7],1.04);
N=input('Enter overlap_save Block length N =');
L=input('Enter overlap_add Block length L =');
subplot(4,2,1);
plot(x);
title('1st sequence x(n)');
subplot(4,2,2);
stem(h);
title('2nd sequence h(n)');
a1=conv(x,h);
subplot(4,2,3.5)
plot(a1);
title('Sectional Convolution');
lx=length(x);
lh=length(h);
m=lh-1;
x=[zeros(1,m) x zeros(1,N-1)];
h=[h zeros(1,N-lh)];
L1=N-lh+1;
k=floor((lx+lh-1)/L1);
for i=0:k
y=x(1,i*L1+1:i*L1+N);
q=ovlap_save(y,h);
outputBySave(i+1,:)=q;
end
p1=outputBySave(:,lh:N)';
outputBySave=p1(:)'
subplot(4,2,5.5)
plot(outputBySave);
title('Sectional Convolution using Overlap Save method');
 
Nx=length(x);
M=length(h);
M1=M-1;
R=rem(Nx,L);
N=L+M1;
x=[x zeros(1,L-R)];
h=[h zeros(1,N-M)];
K=floor(Nx/L);
y=zeros(K+1,N);
z=zeros(1,M1);
for k=0:K
xp=x(L*k+1:L*k+L);
xk=[xp z];
y(k+1,:)=ovlap_add(xk,h);
end
p=L+M1;
for i=1:K
y(i+1,1:M-1)=y(i,p-M1+1:p)+y(i+1,1:M-1);
end
z1=y(:,1:L)';
y=(z1(:))'
outputByAdd=y;
subplot(4,2,7.5)
plot(outputByAdd);
title('Convolution using Overlap Add method');
 
player1=audioplayer(x1,fs,nbits);
play(player1)
pause(1);
player2=audioplayer(x,fs,nbits);
play(player2)
pause(1);
player3=audioplayer(outputBySave,fs,nbits);
play(player3)
pause(1);
player4=audioplayer(outputByAdd,fs,nbits);
play(player4)

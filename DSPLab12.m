%% Question 2
close all;clear all;clc;
figure('Name','Question 2');
%% Def.
fileName='welcome.wav';
noiseK=0.25;
[y,fs,nbits]=wavread(fileName);
y=y';
L=length(y);
viewRange=(2:L);
N=256;
%% Compute
Y=abs(fft(y));
Noise=noiseK*rand(1,L);
NOISE=abs(fft(Noise));
output=y+Noise;
h=fspecial('gaussian',[1,7],1.04);
h=h/max(h);
result=conv(output,h);

M=length(h);
K=ceil(L/(N+1-M));
outputBySave=zeros(1,L);
for i=1:1:K
    x=zeros(1,N);
    switch i
        case 1
            x=[x(1:M-1) output(1:i*(N+1-M))];
        case K
            x=output((i-1)*(N-M+1)+(2-M):L) ;
        otherwise
            x=output((i-1)*(N-M+1)+(2-M):i*(N-M+1));
    end
    temp=conv(x,h);
    if i==K
        temp=temp(M:length(temp));
    else
        temp=temp(M:N);
    end
    if i==1
        outputBySave=temp;
    else
        outputBySave=[outputBySave(1:(i-1)*(N-M+1)) temp];
    end
end

K=ceil((L-M-1)/(N+1-M));
outputByAdd=zeros(1,L);
for i=1:1:K
    x=zeros(1,N);
    switch i
        case 1
            x=output(1:N);
        case K
            x=output((i-1)*(N-M+1)+1:L) ;
        otherwise
            x=output((i-1)*(N-M+1)+1:i*(N-M+1)+M-1);
    end
    temp=conv(x,h);
    if i==K
        temp=temp(1:length(temp));
    else
        temp=temp(1:N);
    end
    if i==1
        outputByAdd=temp;
    else
        temp2=outputByAdd(length(outputByAdd)-M+2:length(outputByAdd));
        temp2=temp2+temp(1:M-1);
        outputByAdd=[outputByAdd(1:(i-1)*(N-M+1)) temp2 temp(M:length(temp))];
    end
end

w=(1:L)/fs;

%% Output
subplot(2,3,1);
plot(output);title('have noise sigbal in time domain');axis tight;xlabel('point');ylabel('magnitude');
subplot(2,3,2);
stem(h);title('filter kernel in time domain');axis tight;xlabel('point');ylabel('magnitude');
subplot(2,3,3);
plot(result);title('convolution result');axis tight;xlabel('point');ylabel('magnitude');
subplot(2,3,4);
plot(outputBySave);title('overlap and save result');axis tight;xlabel('point');ylabel('magnitude');
subplot(2,3,5);
plot(outputByAdd);title('input on freq. domain');axis tight;xlabel('point');ylabel('magnitude');

player1=audioplayer(output,fs,nbits);
play(player1)
pause(1);
player2=audioplayer(result,fs,nbits);
play(player2)
pause(1);
player3=audioplayer(outputBySave,fs,nbits);
play(player3)
pause(1);
player4=audioplayer(outputByAdd,fs,nbits);
play(player4)
clear all;clc;close all;
%% Question 1
figure('Name','Question 1 and 2');
%% Define
wp1=0.3*pi; ws1=0.4*pi;
ws2=0.5*pi; wp2=0.6*pi;
wp=[wp1 wp2];
ws=[ws1 ws2];
As=50; Rp=0.5;
num=4096;
%% Compute
%% IIR
[N_butter,Wn_butter]=buttord(wp/pi,ws/pi,Rp,As);
[N_cheby2,Wn_cheby2]=cheb2ord(wp/pi,ws/pi,Rp,As);
[N_elliptic,Wn_elliptic]=ellipord(wp/pi,ws/pi,Rp,As);
[B_butter,A_butter]=butter(N_butter,Wn_butter,'stop');
[B_cheby2,A_cheby2]=cheby2(N_cheby2,As,Wn_cheby2,'stop');
[B_elliptic,A_elliptic]=ellip(N_elliptic,Rp,As,Wn_elliptic,'stop');
[H_butter,w_butter] = freqz(B_butter,A_butter,num);
[H_cheby2,w_cheby2] = freqz(B_cheby2,A_cheby2,num);
[H_elliptic,w_elliptic] = freqz(B_elliptic,A_elliptic,num);
angle_butter = atan(real(H_butter+eps)./imag(H_butter));
angle_cheby2 = atan(real(H_cheby2+eps)./imag(H_cheby2));
angle_elliptic = atan(real(H_elliptic+eps)./imag(H_elliptic));
% angle_butter = phase(H_butter+eps);
% angle_cheby2 = phase(H_cheby2+eps);
% angle_elliptic = phase(H_elliptic+eps);
%% FIR
deltaF=wp2-ws2;
deltaP=(10^(Rp/20)-1)/(10^(Rp/20)+1)
deltaS=(1+deltaP)/(10^(As/20));
[M,fo,ao,W]=firpmord([wp1,ws1,ws2,wp2]/pi,[1,0,1],[deltaP,deltaS,deltaP]);
M
newM=M;
N=orderFromAlgorithm(deltaP,deltaS,deltaF)
[h,delta] = firpm(newM,fo,ao,W);
delta
H=fft(h,num);
H_mag=db(fft(h,num));
H_angle=atan(real(H+eps)./imag(H+eps));
% H_angle=phase(H+eps);
H_mag=H_mag(1:num/2);
H_angle=H_angle(1:num/2);
w4H=linspace(0,pi,num/2);
%% Plot
subplot(4,2,1);
plot(w_butter/pi,db(abs(H_butter)));axis tight;title(['magnitude response of butterworth, order =',int2str(2*N_butter)]);xlabel('\omega/\pi');ylabel('Magnitude(dB)');axis tight;grid on;
subplot(4,2,2);
plot(w_butter/pi,angle_butter);axis tight;title('phase response of butterworth');xlabel('\omega/\pi');ylabel('phase(degrees)');axis tight;
subplot(4,2,3);
plot(w_cheby2/pi,db(abs(H_cheby2)));axis tight;title(['magnitude response of cheby2, order =',int2str(2*N_cheby2)]);xlabel('\omega/\pi');ylabel('Magnitude(dB)');axis tight;grid on;
subplot(4,2,4);
plot(w_cheby2/pi,angle_cheby2);axis tight;title('phase response of cheby2');xlabel('\omega/\pi');ylabel('phase(degrees)');axis tight;
subplot(4,2,5);
plot(w_elliptic/pi,db(abs(H_elliptic)));axis tight;title(['magnitude response of elliptic, order =',int2str(2*N_elliptic)]);xlabel('\omega/\pi');ylabel('Magnitude(dB)');axis tight;grid on;
subplot(4,2,6);
plot(w_elliptic/pi,angle_elliptic);axis tight;title('phase response of elliptic');xlabel('\omega/\pi');ylabel('phase(degrees)');axis tight;
subplot(4,2,7);
plot(w4H/pi,H_mag),xlabel('\omega/\pi');title(['ori. order=',int2str(M),', new order=',int2str(newM),', order of algorithm=',int2str(N),', magnitude response']);axis tight;grid on;
subplot(4,2,8);
plot(w4H/pi,H_angle);xlabel('\omega/\pi');title('phase response');axis tight;

%% Question 3
clear all;clc;
figure('Name','Question 3');
%% Define
K=[1 2 3 4];
pens=['m','r','g'];
alpha1=[0.5 0.75 1];
alpha2=-alpha1;
num = 10240;
Omg = linspace(0,6*pi,num);
alpha_type_num = 2;
%% Compute
for alpha_num = 1:1:alpha_type_num
    for k_num = 1:1:length(K)
        subplot(alpha_type_num,length(K),(alpha_num-1)*length(K)+k_num);
        for alpha_array_num = 1:1:length(alpha1)
            if (alpha_num==1)
                H=sqrt( (1+alpha1(alpha_array_num)^2) + (2*alpha1(alpha_array_num)*cos(Omg*K(k_num))) );
                alpha_value = alpha1(alpha_array_num);
                s=char(['\alpha=',mat2str(alpha1(1))],['\alpha=',mat2str(alpha1(2))],['\alpha=',mat2str(alpha1(3))]);
            elseif (alpha_num==2)
                H=1./ sqrt( (1+alpha1(alpha_array_num)^2) - (2*alpha1(alpha_array_num)*cos(Omg*K(k_num))) );
                alpha_value = alpha2(alpha_array_num);
                s=char(['\alpha=',mat2str(alpha2(1))],['\alpha=',mat2str(alpha2(2))],['\alpha=',mat2str(alpha2(3))]);
            end
            plot(Omg/pi,abs(H),pens(alpha_array_num));axis tight;title(['filter type =',int2str(alpha_num),', K =',int2str(K(k_num))]);xlabel('\Omega/\pi');ylabel('magnitude');
            hold on;
        end
        legend(s) 
    end
end
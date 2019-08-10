clear all;clc;
% /****************************/
% /****************************/
Master=16;
Nonius=15;
Segment=12;
TotalBit=11;
StartDeg=0;
EndDeg=360;
% /****************************/
% /*        compute           */
% /****************************/
% /* Bit Setting */
HightBit=log2(sqrt(Master));
MidBit=HightBit;
LowBit=TotalBit-HightBit-MidBit;
% /* Deg with per bit */
x=linspace(StartDeg,EndDeg,2^TotalBit);
% /* Simulation mSin and mCos from ADC */
%    /*  10 bit ADC (Maybe will use float in MCU) */
mSin=512*(sin(Master*x*pi/180)+1);
mCos=512*(cos(Master*x*pi/180)+1);
%    /*  12 bit ADC (Maybe will use float in MCU) */
%mSin=2048*(sin(Master*x*pi/180)+1);
%mCos=2048*(cos(Master*x*pi/180)+1);
% /* Transform Sin and cos signal from ADC */
%    /* 10 bit used */ 
mSin=mSin-512;
mCos=mCos-512;
%    /* 12 bit used */
%mSin=mSin-2048;
%mCos=mCos-2048;
% /* Sin and cos signal transform to Ramp singal */
for i=1:1:length(mSin)
    if(mSin(i)>=0 && mCos(i)>=0) % quadrant 1
        matan(i)=atan(mSin(i)/mCos(i))*180/pi;
    end
    if(mCos(i)<0) % quadrant 2 and 3
        matan(i)=180+atan(mSin(i)/mCos(i))*180/pi;
    end
    if(mSin(i)<0 && mCos(i)>=0) % quadrant 4
        matan(i)=360+atan(mSin(i)/mCos(i))*180/pi;
    end            
end
% /* Simulation sSin and sCos from ADC */
%    /*  10 bit ADC (Maybe will use float in MCU) */
sSin=512*(sin(Segment*x*pi/180)+1);
sCos=512*(cos(Segment*x*pi/180)+1);
%    /*  12 bit ADC (Maybe will use float in MCU) */
%sSin=2048*(sin(Segment*x*pi/180)+1);
%sCos=2048*(cos(Segment*x*pi/180)+1);
% /* Transform Sin and cos signal from ADC */
%    /* 10 bit used */ 
sSin=sSin-512;
sCos=sCos-512;
%    /* 12 bit used */
%sSin=sSin-2048;
%sCos=sCos-2048;
% /* Sin and cos signal transform to Ramp singal */
for i=1:1:length(sSin)
    if(sSin(i)>=0 && sCos(i)>=0) % quadrant 1
        satan(i)=atan(sSin(i)/sCos(i))*180/pi;
    end
    if(sCos(i)<0) % quadrant 2 and 3
        satan(i)=180+atan(sSin(i)/sCos(i))*180/pi;
    end
    if(sSin(i)<0 && sCos(i)>=0) % quadrant 4
        satan(i)=360+atan(sSin(i)/sCos(i))*180/pi;
    end            
end
% /* Simulation nSin and nCos from ADC */
%    /*  10 bit ADC (Maybe will use float in MCU) */
nSin=512*(sin(Nonius*x*pi/180)+1);
nCos=512*(cos(Nonius*x*pi/180)+1);
%    /*  12 bit ADC (Maybe will use float in MCU) */
%nSin=2048*(sin(Nonius*x*pi/180)+1);
%nCos=2048*(cos(Nonius*x*pi/180)+1);
% /* Transform Sin and cos signal from ADC */
%    /* 10 bit used */ 
nSin=nSin-512;
nCos=nCos-512;
%    /* 12 bit used */
%nSin=nSin-2048;
%nCos=nCos-2048;
% /* Sin and cos signal transform to Ramp singal */
for i=1:1:length(nSin)
    if(nSin(i)>=0 && nCos(i)>=0) % quadrant 1
        natan(i)=atan(nSin(i)/nCos(i))*180/pi;
    end
    if(nCos(i)<0) % quadrant 2 and 3
        natan(i)=180+atan(nSin(i)/nCos(i))*180/pi;
    end
    if(nSin(i)<0 && nCos(i)>=0) % quadrant 4
        natan(i)=360+atan(nSin(i)/nCos(i))*180/pi;
    end            
end
% /* Set a1 , a2 and a3 , (see excel figure) */
yM=matan;
yN=natan;
yS=satan;
% /* Set B2 , B1 and a1 , (see excel figure) */
B2=int16(floor(mod(yM-yN,360)/360*2^HightBit));
B1=int16(floor(mod(yM-yS,360)/360*2^MidBit));
a1=int16(yM/EndDeg*(2^LowBit));
% /* decoder */
a=int64(a1);
b=int64(B1)*int64(2^LowBit);
c=int64(int64(B2)*int64(2^(MidBit+LowBit)));
result=a+b+c;
% /****************************/
% /*        plot              */
% /****************************/
subplot(3,4,1);
plot(x,matan);
title('from ADC singal decoder(Master sin)');xlabel('Deg');ylabel('Value');axis tight;
subplot(3,4,5);
plot(x,satan);
title('from ADC singal decoder(Segment sin)');xlabel('Deg');ylabel('Value');axis tight;
subplot(3,4,9);
plot(x,natan);
title('from ADC singal decoder(Nonius sin)');xlabel('Deg');ylabel('Value');axis tight;
subplot(3,4,2);
plot(x,yM);
title('Master');xlabel('Deg');ylabel('Value');axis tight;
subplot(3,4,6);
plot(x,yS);
title('Segment');xlabel('Deg');ylabel('Value');axis tight;
subplot(3,4,10);
plot(x,yN);
title('Nonius');xlabel('Deg');ylabel('Value');axis tight;
subplot(3,4,3);
plot(x,B2);
title('HightBit');xlabel('Deg');ylabel('Value');axis tight;
subplot(3,4,7);
plot(x,B1);
title('MidBit');xlabel('Deg');ylabel('Value');axis tight;
subplot(3,4,11);
plot(x,a1);
title('a1');xlabel('Deg');ylabel('Value');axis tight;
subplot(3,4,4);
plot(x,result);
title('Resolution');xlabel('Deg');ylabel('Value');axis tight;
function y=JsLPF(Fcut,N);
if mod(N,2)==0
    error('N should be odd');
end
n=-(N-1)/2:(N-1)/2;
y=sin((n+eps)*2*pi*Fcut)./(pi*(n+eps));
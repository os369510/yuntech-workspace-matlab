function y=DTFT(x,M)
N=length(x);
y=zeros(1,M);
o=linspace(0,2*pi,M);
for k=1:length(o)
    for i=1:N
        y(k)=y(k)+x(i)*exp(-j*o(k)*i);
    end
end


fs=1e5;
B=fir1(32,1e3/(1e5/2));
plot(B);pause;
B15=round(B*32767);
t=0:1/fs:10/1e3;
X=(sin(2*pi*t*500)+sin(2*pi*t*5000))/2;
X16=round(X*32767);


for n=1:length(t)-length(B15)
    Y(n)=0;
    for j=1:length(B15)
        Y(n)=Y(n)+B15(j)*X16(j+n-1);
    end 
    Y(n)=round(Y(n)/32768);
    
end

plot(Y)
function y=interpolation_2(x)
y=zeros(1,length(x)*2);
Ly=length(y)
for i=1:1:Ly-1
    if mod((i-1),2)==0
        y(i)=x((i+1)/2);
    else
        y(i)=(x((i/2)+1)+x(i/2))/2;
    end
end
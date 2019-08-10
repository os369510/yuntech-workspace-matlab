figure('Name','Problem2');
x0=zeros(1,200);
for i=1:1:200
    x0(i)=cos(0.1*pi*(i-1))+2*sin(0.3*pi*(i-1));
end
subplot(5, 1 ,1),plot(x0),grid off,axis('tight'), xlabel('n'), ylabel('x[n]'),title('(a)')
 
x1=zeros(1,200);
for i=1:1:200
    x1(i)=cos(0.1*pi*(i-1))+2*cos(0.3*pi*(i-1));
end
subplot(5, 1 ,2),plot(x1),grid off,axis('tight'), xlabel('n'), ylabel('x[n]'),title('(b)')
 
x2=zeros(1,200);
for i=1:1:200
    x2(i)=3*cos(0.1*pi*(i-1)+pi/3)+1.5*sin(0.5*pi*(i-1));
end
subplot(5, 1 ,3),plot(x2),grid off,axis('tight'), xlabel('n'), ylabel('x[n]'),title('(c)')
 
x3=zeros(1,200);
for i=1:1:200
    x3(i)=3*cos(0.4*(i-1)+pi/3)+1.5*sin(0.5*(i-1));
end
subplot(5, 1 ,4),plot(x3),grid off,axis('tight'), xlabel('n'), ylabel('x[n]'),title('(d)')
 
x4=zeros(1,200);
for i=1:1:200
    x4(i)=cos(0.11*pi*(i-1));
end
subplot(5, 1 ,5),plot(x4),grid off,axis('tight'), xlabel('n'), ylabel('x[n]'),title('(e)')

function y=dirfilter(b,a,x);
N=length(x);
y=filter(b,a,x);
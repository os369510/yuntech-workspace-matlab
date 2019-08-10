function [x,n]=stepseq(n0,n1,n2)
if n1>n2
    error('n1>n2!');
elesif n0>n2
    error('n0>n2!');
elesif n1>n0
    error('n1>n0!');
end
n=n1:n2;
x=[(n-n0)>=0];

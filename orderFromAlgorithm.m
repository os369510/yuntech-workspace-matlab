function N=orderFromAlgorithm(Dp,Ds,dw);
df=dw/(2*pi);
N=ceil( (-20*log10(sqrt(Dp*Ds))-13) / (14.6*df) ) +1;
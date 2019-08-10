function y=parfilter(C, B, A, x);
% y=output sequence;
% C=polynominal (FIR) part when M>=N
% B= K by 3 matrix of real coefficients containing bk¡¦s
%A= K by 3 matrix of real coefficients containing ak¡¦s
%x=input sequence
%
[K, L]=size(B);
N=length(x);
w=zeros(K+1, N);
w(1, :)=filter(C, 1, x);
for i=1:K
w(i+1, :) =filter(B(i, :), A(i, :), x);
end
y=sum(w);  
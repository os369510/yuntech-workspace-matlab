function [y,index] = dnsample(x,M,O)
y=zeros(1,101);
%璸衡y皚
l=fix(length(x)/M); %俱计
remainder = mod(length(x),M); %緇计
if( ((l+1)*M) < length(x) ) l=l+1;
end
%璸衡y翴竚
index=fix(O/M); 
remainder =mod(O,M);
if(remainder>0 || remainder<0) index=index+1; %緇计单0
end
%y翴
y(index)=x(O);
%y翴
for i=1:1:l-index
    y(i+index)=x(O+i*M);
end
%y翴玡
for i=1:1:index-1
    y(index-i)=x(O-i*M);
end

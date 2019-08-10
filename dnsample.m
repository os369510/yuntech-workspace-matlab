function [y,index] = dnsample(x,M,O)
y=zeros(1,101);
%計算y陣列長度
l=fix(length(x)/M); %取整數
remainder = mod(length(x),M); %取餘數
if( ((l+1)*M) < length(x) ) l=l+1;
end
%計算y原點位置
index=fix(O/M); 
remainder =mod(O,M);
if(remainder>0 || remainder<0) index=index+1; %餘數等於0
end
%y原點值
y(index)=x(O);
%y原點以後
for i=1:1:l-index
    y(i+index)=x(O+i*M);
end
%y原點以前
for i=1:1:index-1
    y(index-i)=x(O-i*M);
end

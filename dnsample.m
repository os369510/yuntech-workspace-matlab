function [y,index] = dnsample(x,M,O)
y=zeros(1,101);
%�p��y�}�C����
l=fix(length(x)/M); %�����
remainder = mod(length(x),M); %���l��
if( ((l+1)*M) < length(x) ) l=l+1;
end
%�p��y���I��m
index=fix(O/M); 
remainder =mod(O,M);
if(remainder>0 || remainder<0) index=index+1; %�l�Ƶ���0
end
%y���I��
y(index)=x(O);
%y���I�H��
for i=1:1:l-index
    y(i+index)=x(O+i*M);
end
%y���I�H�e
for i=1:1:index-1
    y(index-i)=x(O-i*M);
end

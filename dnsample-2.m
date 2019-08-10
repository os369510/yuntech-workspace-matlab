function [y,Index,xPoint,yP]=dnsample(x,M,index)
L=length(x);
startIndex=1-index;
endIndex=L-index;
xPoint=startIndex:1:endIndex;
if ( mod(startIndex,2) & mod(endIndex,2) ) % both odd
    yL=floor(L/M);
    y=zeros(1,floor(L/M));
    yP=zeros(1,floor(L/M));
elseif ( mod(startIndex,2) & not(mod(endIndex,2)) ) % startIndex: odd , endIndex: even
    yL=L/M;
    y=zeros(1,L/M);
    yP=zeros(1,L/M);
elseif ( not(mod(startIndex,2)) & mod(endIndex,2) ) % startIndex: even , endIndex : odd
    yL=L/M;
    y=zeros(1,L/M);
    yP=zeros(1,L/M);
elseif ( not(mod(startIndex,2)) & not(mod(endIndex,2)) ) % both even
    yL=ceil(L/M);
    y=zeros(1,ceil(L/M));
    yP=zeros(1,ceil(L/M));
end
yPoint=xPoint/M;
count=1;
for i=1:1:length(yPoint)
    if(mod(yPoint(i),1)==0)
        yP(count)=yPoint(i);
        count=count+1;
    end        
end
for i=1:1:yL
    for k=1:1:L
        if (yP(i)*M==xPoint(k))
            y(i)=x(k);
        end
    end
end
Index=ceil(index/M);
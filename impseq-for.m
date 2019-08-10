% function [x,n,w]=imseq(n0,n1,n2)
% x=[n1:n2];
% % w=[n1:n2];
% for i=1:1:(n2-n1+1)
%     if( x(i) == n0 )
%         x(i)=1;
%     else
%         x(i)=0;
%     end
% end
% n=length(x);

function [x,n] = impseq(n0,n1,n2);
 n=n2-n1+1;
 x=zeros(1,n);
 for i=n0:1:n2
    if i==n1
        x(i)=1;
    end

end
function input=sSkeletonByErosion(input)
inputSize=size(input);
imageHeight=inputSize(1);
imageWidth=inputSize(2);
for y=1:imageHeight
    for x=1:imageWidth
        if (y==1 || y==imageHeight || x==1 || x==imageWidth)
            input(y,x)=0;
        elseif(input(y,x)==1)
%             if( (input(y-1,x-1)&(input(y+1,x+1)|input(y,x+1)|input(y+1,x))) || ...
%                     (input(y-1,x)&(input(y+1,x)|input(y+1,x-1)|input(y+1,x+1))) || ...
%                     (input(y-1,x+1)&(input(y+1,x-1)|input(y+1,x)|input(y,x-1))) || ...
%                     (input(y,x-1)&(input(y,x+1)|input(y-1,x+1)|input(y+1,x+1))))
              if( (input(y-1,x-1)&(input(y+1,x+1))) || ...
                    (input(y-1,x)&(input(y+1,x))) || ...
                    (input(y-1,x+1)&(input(y+1,x-1))) || ...
                    (input(y,x-1)&(input(y,x+1))))
                input(y,x)=1;
            elseif ( (input(y-1,x-1)+input(y-1,x)+input(y-1,x+1) + ...
                    input(y,x-1)+input(y,x+1) + ...
                    input(y+1,x-1)+input(y+1,x)+input(y+1,x+1)) == 1 )
                input(y,x)=1;
            else
                input(y,x)=0;
            end
        else
            input(y,x)=0;            
        end
    end
end
for y=1:imageHeight
    for x=imageWidth-1:-1:2
        if (y==1 || y==imageHeight || x==1 || x==imageWidth)
            input(y,x)=0;
        elseif(input(y,x)==1)
%             if( (input(y-1,x-1)&(input(y+1,x+1)|input(y,x+1)|input(y+1,x))) || ...
%                     (input(y-1,x)&(input(y+1,x)|input(y+1,x-1)|input(y+1,x+1))) || ...
%                     (input(y-1,x+1)&(input(y+1,x-1)|input(y+1,x)|input(y,x-1))) || ...
%                     (input(y,x-1)&(input(y,x+1)|input(y-1,x+1)|input(y+1,x+1))))
              if( (input(y-1,x-1)&(input(y+1,x+1))) || ...
                    (input(y-1,x)&(input(y+1,x))) || ...
                    (input(y-1,x+1)&(input(y+1,x-1))) || ...
                    (input(y,x-1)&(input(y,x+1))))
                input(y,x)=1;
            elseif ( (input(y-1,x-1)+input(y-1,x)+input(y-1,x+1) + ...
                    input(y,x-1)+input(y,x+1) + ...
                    input(y+1,x-1)+input(y+1,x)+input(y+1,x+1)) == 1 )
                input(y,x)=1;
            else
                input(y,x)=0;
            end
        else
            input(y,x)=0;            
        end
    end
end
for y=imageHeight-1:-1:2
    for x=imageWidth-1:-1:2
        if (y==1 || y==imageHeight || x==1 || x==imageWidth)
            input(y,x)=0;
        elseif(input(y,x)==1)
%             if( (input(y-1,x-1)&(input(y+1,x+1)|input(y,x+1)|input(y+1,x))) || ...
%                     (input(y-1,x)&(input(y+1,x)|input(y+1,x-1)|input(y+1,x+1))) || ...
%                     (input(y-1,x+1)&(input(y+1,x-1)|input(y+1,x)|input(y,x-1))) || ...
%                     (input(y,x-1)&(input(y,x+1)|input(y-1,x+1)|input(y+1,x+1))))
              if( (input(y-1,x-1)&(input(y+1,x+1))) || ...
                    (input(y-1,x)&(input(y+1,x))) || ...
                    (input(y-1,x+1)&(input(y+1,x-1))) || ...
                    (input(y,x-1)&(input(y,x+1))))
                input(y,x)=1;
            elseif ( (input(y-1,x-1)+input(y-1,x)+input(y-1,x+1) + ...
                    input(y,x-1)+input(y,x+1) + ...
                    input(y+1,x-1)+input(y+1,x)+input(y+1,x+1)) == 1 )
                input(y,x)=1;
            else
                input(y,x)=0;
            end
        else
            input(y,x)=0;            
        end
    end
end
for y=imageHeight-1:-1:2
    for x=1:imageWidth
        if (y==1 || y==imageHeight || x==1 || x==imageWidth)
            input(y,x)=0;
        elseif(input(y,x)==1)
%             if( (input(y-1,x-1)&(input(y+1,x+1)|input(y,x+1)|input(y+1,x))) || ...
%                     (input(y-1,x)&(input(y+1,x)|input(y+1,x-1)|input(y+1,x+1))) || ...
%                     (input(y-1,x+1)&(input(y+1,x-1)|input(y+1,x)|input(y,x-1))) || ...
%                     (input(y,x-1)&(input(y,x+1)|input(y-1,x+1)|input(y+1,x+1))))
              if( (input(y-1,x-1)&(input(y+1,x+1))) || ...
                    (input(y-1,x)&(input(y+1,x))) || ...
                    (input(y-1,x+1)&(input(y+1,x-1))) || ...
                    (input(y,x-1)&(input(y,x+1))))
                input(y,x)=1;
            elseif ( (input(y-1,x-1)+input(y-1,x)+input(y-1,x+1) + ...
                    input(y,x-1)+input(y,x+1) + ...
                    input(y+1,x-1)+input(y+1,x)+input(y+1,x+1)) == 1 )
                input(y,x)=1;
            else
                input(y,x)=0;
            end
        else
            input(y,x)=0;            
        end
    end
end
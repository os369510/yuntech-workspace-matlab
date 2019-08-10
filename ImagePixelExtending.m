function Output=ImagePixelExtending (sourceImage,compareImage,originalImage,extendingLength); %synchronousLocal
% source image need be binary image
% synchronousLocal is OverLoad with Local Synchronous ( this parameter
% always need to be 1 or 0 .
ImageSize=size(sourceImage);
Output=ones(ImageSize(1),ImageSize(2))*255;
for y=1:1:ImageSize(1)
    for x=1:1:ImageSize(2)
        switch (sourceImage(y,x))
            case 0 % black
                Output(y,x)=originalImage(y,x);
                
                minV=compareImage(y,x); % syn addition
                label=0; % syn addition
                
                % Upper Side
                label=0; % syn addition
                maxV=compareImage(y,x);
                for i=1:1:y-1
                    if(i>=extendingLength)
                        label=i;
                        break;
                    end
                    if (compareImage(y-i,x)>maxV)
                        maxV=originalImage(y-i,x);
                        if(sourceImage(y-i,x)==0)
                            label=i;
                            break;
                        end
                        Output(y-i,x)=originalImage(y-i,x);
                    else
                        label=i;
                        break;
                    end
                end
                %%% syn addition
                label=label-1; 
                for k=-label:1:label
                    if( y+k>ImageSize(1) | y+k<1)
                        continue;
                    end
                    for u=-label:1:label
                        if( x+u>ImageSize(2) | x+u<1)
                            continue;
                        end
                        if(compareImage(y+k,x+u)>=minV && compareImage(y+k,x+u)<=maxV )
                            Output(y+k,x+u)=originalImage(y+k,x+u);
                        end
                    end
                end
                %%%
                
                % Lower Side
                label=0; % syn addition
                maxV=compareImage(y,x);
                for i=1:1:ImageSize(1)-y
                    if(i>=extendingLength)
                        label=i;
                        break;
                    end
                    if (compareImage(y+i,x)>maxV)
                        maxV=originalImage(y+i,x);
                        if(sourceImage(y+i,x)==0)
                            label=i;
                            break;
                        end
                        Output(y+i,x)=originalImage(y+i,x);
                    else
                        label=i;
                        break;
                    end
                end
                %%% syn addition
                label=label-1; 
                for k=-label:1:label
                    if( y+k>ImageSize(1) | y+k<1)
                        continue;
                    end
                    for u=-label:1:label
                        if( x+u>ImageSize(2) | x+u<1)
                            continue;
                        end
                        if(compareImage(y+k,x+u)>=minV && compareImage(y+k,x+u)<=maxV )
                            Output(y+k,x+u)=originalImage(y+k,x+u);
                        end
                    end
                end
                %%%
                
                % Left Side
                label=0; % syn addition
                maxV=compareImage(y,x);
                for i=1:1:x-1
                    if(i>=extendingLength)
                        label=i;
                        break;
                    end
                    if (compareImage(y,x-i)>maxV)
                        maxV=originalImage(y,x-i);
                        if(sourceImage(y,x-i)==0)
                            label=i;
                            break;
                        end
                        Output(y,x-i)=originalImage(y,x-i);
                    else
                        label=i;
                        break;
                    end
                end
                %%% syn addition
                label=label-1; 
                for k=-label:1:label
                    if( y+k>ImageSize(1) | y+k<1)
                        continue;
                    end
                    for u=-label:1:label
                        if( x+u>ImageSize(2) | x+u<1)
                            continue;
                        end
                        if(compareImage(y+k,x+u)>=minV && compareImage(y+k,x+u)<=maxV )
                            Output(y+k,x+u)=originalImage(y+k,x+u);
                        end
                    end
                end
                %%%
                
                % Right Side
                label=0; % syn addition
                maxV=compareImage(y,x);
                for i=1:1:ImageSize(2)-x
                    if(i>=extendingLength)
                        label=i;
                        break;
                    end
                    if (compareImage(y,x+i)>maxV)
                        maxV=originalImage(y,x+i);
                        if(sourceImage(y,x+i)==0)
                            label=i;
                            break;
                        end
                        Output(y,x+i)=originalImage(y,x+i);
                    else
                        label=i;
                        break;
                    end
                end
                %%% syn addition
                label=label-1; 
                for k=-label:1:label
                    if( y+k>ImageSize(1) | y+k<1)
                        continue;
                    end
                    for u=-label:1:label
                        if( x+u>ImageSize(2) | x+u<1)
                            continue;
                        end
                        if(compareImage(y+k,x+u)>=minV && compareImage(y+k,x+u)<=maxV )
                            Output(y+k,x+u)=originalImage(y+k,x+u);
                        end
                    end
                end
                %%%
                
                % Upper left Side
                label=0; % syn addition
                maxV=compareImage(y,x);
                for i=1:1:min((y-1),(x-1))
                    if(i>=extendingLength)
                        label=i;
                        break;
                    end
                    if (compareImage(y-i,x-i)>maxV)
                        maxV=originalImage(y-i,x-i);
                        if(sourceImage(y-i,x-i)==0)
                            label=i;
                            break;
                        end
                        Output(y-i,x-i)=originalImage(y-i,x-i);
                    else
                        label=i;
                        break;
                    end
                end
                %%% syn addition
                label=label-1; 
                for k=-label:1:label
                    if( y+k>ImageSize(1) | y+k<1)
                        continue;
                    end
                    for u=-label:1:label
                        if( x+u>ImageSize(2) | x+u<1)
                            continue;
                        end
                        if(compareImage(y+k,x+u)>=minV && compareImage(y+k,x+u)<=maxV )
                            Output(y+k,x+u)=originalImage(y+k,x+u);
                        end
                    end
                end
                %%%
                
                % Lower left Side
                label=0; % syn addition
                maxV=compareImage(y,x);
                for i=1:1:min((ImageSize(1)-y),(x-1))
                    if(i>=extendingLength)
                        label=i;
                        break;
                    end
                    if (compareImage(y+i,x-i)>maxV)
                        maxV=originalImage(y+i,x-i);
                        if(sourceImage(y+i,x-i)==0)
                            label=i;
                            break;
                        end
                        Output(y+i,x-i)=originalImage(y+i,x-i);
                    else
                        label=i;
                        break;
                    end
                end
                %%% syn addition
                label=label-1; 
                for k=-label:1:label
                    if( y+k>ImageSize(1) | y+k<1)
                        continue;
                    end
                    for u=-label:1:label
                        if( x+u>ImageSize(2) | x+u<1)
                            continue;
                        end
                        if(compareImage(y+k,x+u)>=minV && compareImage(y+k,x+u)<=maxV )
                            Output(y+k,x+u)=originalImage(y+k,x+u);
                        end
                    end
                end
                %%%
                
                % Upper right Side
                label=0; % syn addition
                maxV=compareImage(y,x);
                for i=1:1:min((y-1),(ImageSize(2)-x))
                    if(i>=extendingLength)
                        label=i;
                        break;
                    end
                    if (compareImage(y-i,x+i)>maxV)
                        maxV=originalImage(y-i,x+i);
                        if(sourceImage(y-i,x+i)==0)
                            label=i;
                            break;
                        end
                        Output(y-i,x+i)=originalImage(y-i,x+i);
                    else
                        label=i;
                        break;
                    end
                end
                %%% syn addition
                label=label-1; 
                for k=-label:1:label
                    if( y+k>ImageSize(1) | y+k<1)
                        continue;
                    end
                    for u=-label:1:label
                        if( x+u>ImageSize(2) | x+u<1)
                            continue;
                        end
                        if(compareImage(y+k,x+u)>=minV && compareImage(y+k,x+u)<=maxV )
                            Output(y+k,x+u)=originalImage(y+k,x+u);
                        end
                    end
                end
                %%%
                
                % Lower right Side
                label=0; % syn addition
                maxV=compareImage(y,x);
                for i=1:1:min((ImageSize(1)-y),(ImageSize(2)-x))
                    if(i>=extendingLength)
                        label=i;
                        break;
                    end
                    if (compareImage(y+i,x+i)>maxV)
                        maxV=originalImage(y+i,x+i);
                        if(sourceImage(y+i,x+i)==0)
                            label=i;
                            break;
                        end
                        Output(y+i,x+i)=originalImage(y+i,x+i);
                    else
                        label=i;
                        break;
                    end
                end
                %%% syn addition
                label=label-1; 
                for k=-label:1:label
                    if( y+k>ImageSize(1) | y+k<1)
                        continue;
                    end
                    for u=-label:1:label
                        if( x+u>ImageSize(2) | x+u<1)
                            continue;
                        end
                        if(compareImage(y+k,x+u)>=minV && compareImage(y+k,x+u)<=maxV )
                            Output(y+k,x+u)=originalImage(y+k,x+u);
                        end
                    end
                end
                %%%
                
                %break;
            case 1 % white
                %break;
            otherwise
                %break;
        end
    end
end
Output=uint8(Output);
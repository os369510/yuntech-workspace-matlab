function Output=sFuzzyRules3x3(Input,thesValue);
% Input and Output is Gray Image
% thresValue like a high-pass filter threshold value
Input_size=size(Input);
Output=ones(Input_size(1,1),Input_size(1,2));
mask=zeros(3:3);
for x=2:1:Input_size(1,1)-1
    for y=2:1:Input_size(1,2)-1
        % fulling mask
        mask(1,1)=Input(x-1,y-1);
        mask(1,2)=Input(x,y-1);
        mask(1,3)=Input(x+1,y-1);
        
        mask(2,1)=Input(x-1,y);
        mask(2,2)=Input(x,y);
        mask(2,3)=Input(x+1,y);
        
        mask(3,1)=Input(x-1,y+1);
        mask(3,2)=Input(x,y+1);
        mask(3,3)=Input(x+1,y+1);
        % threshold
        for xm=1:1:3
            for ym=1:1:3
                flash=mask(ym,xm);
                mask(ym,xm)=(flash>(Input(x,y)+thesValue));
            end
        end
        %compare
        if( (mask(1,1)==1 && mask(1,2)==1 && mask(1,3)==1 && mask(2,1)==0 && mask(2,3)==0) || ...,       %// ¡Ç
                (mask(1,1)==1 && mask(1,2)==0 && mask(2,1)==1 && mask(3,1)==1 && mask(3,2)==0) || ...,   %// ¡Y
                (mask(2,1)==0 && mask(2,3)==0 && mask(3,1)==1 && mask(3,2)==1 && mask(3,3)==1) || ...,   %// ¡W
                (mask(1,2)==0 && mask(1,3)==1 && mask(2,3)==1 && mask(3,2)==0 && mask(3,3)==1) || ...,   %// ¡Ä
                (mask(1,1)==1 && mask(1,2)==1 && mask(2,1)==1 && mask(2,3)==0 && mask(3,2)==0) || ...,   %// ¢z
                (mask(1,2)==0 && mask(2,1)==1 && mask(2,3)==0 && mask(3,1)==1 && mask(3,2)==1) || ...,   %// ¢|
                (mask(1,2)==1 && mask(1,3)==1 && mask(2,1)==0 && mask(2,3)==1 && mask(3,2)==0) || ...,   %// ¢{
                (mask(1,2)==0 && mask(2,1)==0 && mask(2,3)==1 && mask(3,2)==1 && mask(3,3)==1) )         %// ¢}
            Output(x,y)=0;
        end
    end
end
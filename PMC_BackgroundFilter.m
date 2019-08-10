close all;clear all;clc;
%Initialize
% Input=imread('0701-4-10.bmp');
% Input=imread('0701-4-11.bmp');
Input=imread('0701-10-1.bmp');
Input_Ps=imread('0701-10-1_ps2.bmp');
Input_Ps=rgb2gray(Input_Ps);
%  Input_ROI=Input(:,:);%
% Input_ROI=Input(572:896,287:755);%250:750
Input_ROI=Input(201:800,:);%
InputPs_ROI=Input_Ps(201:800,:);%
InputPs_ROI_Original = InputPs_ROI;
% Input_ROI=histeq(Input_ROI);
InputPs_size=size(InputPs_ROI);

%% Dark Side
%Compute
% Curve
% maxValue=max(255^25);
% c=255/maxValue;

% Low-Pass filter
Input_LPF=imfilter(Input_ROI,ones(5,5)/25);

Output_threshold = im2bw(InputPs_ROI,128/255);  % step .1

Output_MedfiltAfterThres=medfilt2(Output_threshold,[3,3]);

% Output_extending = ImagePixelExtending(Output_threshold);

Output_extending=ImagePixelExtending(Output_MedfiltAfterThres,Input_LPF,Input_ROI,5);

% Output_extending=medfilt2(Output_extending,[3,3]);

%%  Bright Side
Input_Bright_PS=imread('0701-10-1_FindBrightSide_PS1.bmp');
Input_Bright_PS=rgb2gray(Input_Bright_PS);
Input_Bright_PS=Input_Bright_PS(201:800,:);
% %區塊直方圖等化
% Output_histeq=zeros(Input_size(1),Input_size(2));
% masksize=50;
% for masky=1:1:Input_size(1)/masksize
%     for maskx=1:1:Input_size(2)/masksize
%         Input_ROI_mask=Output_PLT( (masky-1)*masksize+1 : (masky-1)*masksize+masksize , (maskx-1)*masksize+1 : (maskx-1)*masksize+masksize);
%         Input_ROI_mask=histeq(Input_ROI_mask);
%         Output_histeq( (masky-1)*masksize+1 : (masky-1)*masksize+masksize , (maskx-1)*masksize+1 : (maskx-1)*masksize+masksize) = Input_ROI_mask;
%     end
% end

% Threshold 
Input_Bright_otsu=im2bw(Input_Bright_PS);
Input_Bright_threshold=im2bw(Input_Bright_PS,254/255);

% Output_histeq=uint8(Output_histeq);
        
% Power Low Transform
% % % % Output_PLT=zeros(InputPs_size(1),InputPs_size(2));
% % % % for x=1:1:InputPs_size(1)
% % % %     for y=1:1:InputPs_size(2)
% % % % %         k=Input_ROI(x,y);
% % % % %         k1=double(double(k)^10)
% % % % %         Outpu(x,y)=k*c;
% % % %         Output_PLT(x,y)=sCurveImage(Input_ROI(x,y),0.4);
% % % %     end
% % % % end

% Output_PLT=uint8(Output_PLT);

% fuzzy rules
% % % % % Output_fuzzy=sFuzzyRules3x3(Output_PLT,3);
% OuputNPS_fuzzy=sFuzzyRules3x3(Input_ROI,0);

% medfilter
Output_Bright_Medfilter=medfilt2(Input_Bright_threshold,[7,7]);
% Output_medfilter=medfilt2(Output_medfilter,[3,3]);
% Output_medfilter=medfilt2(Output_medfilter,[3,3]);
% Output_medfilter=medfilt2(Output_medfilter,[3,3]);

% Labeling
Output_Bright_Labeling=bwlabel(not(Output_Bright_Medfilter),8);
% Statistics
maxLabeling=max(Output_Bright_Labeling(:));
certainWordArray=zeros(1,maxLabeling+1);
for i = 0:1:maxLabeling % determine this label is certain word?
    [r, c] = find(Output_Bright_Labeling==i);
    rc=[r c];
    sizerc=size(rc);
    sum=sizerc(1);
    if( (sum>=500)&&(sum<=16000) ) % if this label is word
        certainWordArray(i+1)=1;
    end
end
Output_Bright_Labeling_filter=ones(InputPs_size(1),InputPs_size(2))*255;
for x=1:1:InputPs_size(1)
    for y=1:1:InputPs_size(2)
        if(certainWordArray(Output_Bright_Labeling(x,y)+1)==1)
            Output_Bright_Labeling_filter(x,y)=0;
        else
            Output_Bright_Labeling_filter(x,y)=255;
        end
    end
end           

Output_Bright_Result=ones(InputPs_size(1),InputPs_size(2))*255;
for x=1:1:InputPs_size(1)
    for y=1:1:InputPs_size(2)
        if( Output_Bright_Labeling_filter(x,y) == 0 )
            Output_Bright_Result(x,y) = Input_ROI(x,y);
        end
    end
end
Output_Bright_Result=uint8(Output_Bright_Result);

Output_Summation_DarkAndBright=ones(InputPs_size(1),InputPs_size(2))*255;
%% Summation
for x=1:1:InputPs_size(1)
    for y=1:1:InputPs_size(2)
        if( (Output_Bright_Result(x,y)~=255) | (Output_extending(x,y)~=255) )
            Output_Summation_DarkAndBright(x,y)=Input_ROI(x,y);
        end
    end
end
Output_Summation_DarkAndBright=uint8(Output_Summation_DarkAndBright);
Output_Result_medfilt=medfilt2(Output_Summation_DarkAndBright,[7,7]);

%% Test
Input_Bright_PS2=imread('0701-10-1_FindBrightSide_PS2.bmp');
Input_Bright_PS2=rgb2gray(Input_Bright_PS2);
Input_Bright_PS2=sFuzzyRules3x3(Input_Bright_PS2(201:800,:),10);

Output_Bright_PS2_medfilt=medfilt2(Input_Bright_PS2,[3,3]);

%% ??
% % % % % Output_sum=and(logical(Output_fuzzy),Output_threshold); % step .2
% Output_sum=imerode(Output_sum,[0 1 0 ; 1 1 1 ; 0 1 0]);  %test erosion
% % % % % Output_sum_filr=medfilt2(Output_sum,[3,3]);
% Output_sum_filr=imdilate(Output_sum_filr,[0 1 0 ; 1 1 1 ; 0 1 0]);

% Get Full Edge Image
% % % Ouput_FullEdgeImage=GetFullEdgeImage();

%Summation Get Full edge image and close image
% % % Ouput_Sum_FullEdgeAndMethod1=and(Ouput_FullEdgeImage,Output_sum_filr);

% % % Ouput_Sum_FullEdgeAndMethod1_Medfilt=medfilt2(Ouput_Sum_FullEdgeAndMethod1,[3,3]);

% Output_nPS_sum=and(logical(OuputNPS_fuzzy),Output_threshold);
% Output_nPS_sum_filr=medfilt2(Output_nPS_sum,[3,3]);

% Output_nPS_sum_filr=medfilt2(Output_nPS_sum_filr,[5,5]);
% Output_nPS_sum_filr=medfilt2(Output_nPS_sum_filr,[5,5]);
% Output_canny = edge(Input_ROI,'canny');
% k = [ 0 0 1 0 0;
%       0 1 1 1 0;
%       1 1 1 1 0;
%       0 1 1 1 0;
%       0 0 1 0 0;];
% k=[0 1 0;
%    1 1 1;
%    0 1 0;];
% Output_dilation = imdilate(Output_medfilter,k);
% Output_erosion = imerode(Output_dilation,k);

% Input_ROI_double=double(Input_ROI);
% Input_ROI_2=Input_ROI_double*0.5+Output_medfilter*255*0.5;
% Input_ROI_2=uint8(Input_ROI_2);
% Output2=sFuzzyRules3x3(Input_ROI_2);

%%

figure('name','nPS_Original Image')
imshow(Input_ROI)
imwrite(Input_ROI,'Input.bmp');
figure('name','nPS_LPF Image')
imshow(Input_LPF)
figure('name','Original Image')
imshow(InputPs_ROI_Original)
% figure('name','local histeq')
% imshow(Output_histeq)
figure('name','threshold')
imshow(Output_threshold)
figure('name','MedfiltAfterThreshold')
imshow(Output_MedfiltAfterThres)
figure('name','extendind (Result)')
imshow(Output_extending)
figure('name','Bright Original')
imshow(Input_Bright_PS)
figure('name','Bright otsu')
imshow(Input_Bright_otsu)
figure('name','Bright threshold')
imshow(Input_Bright_threshold)
figure('name','Bright Medfilter')
imshow(Output_Bright_Medfilter)
figure('name','Bright Labeling')
imshow(Output_Bright_Labeling)
figure('name','Bright Labeling across filter')
imshow(Output_Bright_Labeling_filter)
figure('name','Bright Result')
imshow(Output_Bright_Result)
figure('name','Result')
imshow(Output_Summation_DarkAndBright)
figure('name','Result medilt')
imshow(Output_Result_medfilt)
imwrite(Output_Result_medfilt,'Output.bmp');
figure('name','Bright PS2 Original')
imshow(Input_Bright_PS2)
figure('name','Result PS2 Medfilt')
imshow(Output_Bright_PS2_medfilt)
% figure('name','fuzzy rules')
% imshow(Output_fuzzy)
% figure('name','medfilter')
% imshow(Output_medfilter);
% figure('name','Sumation(EdgeByFuzzyandThreshold')
% imshow(Output_sum);
% figure('name','Sumation_medfilr')
% imshow(Output_sum_filr);
% % % figure('name','Full Edge Image')
% % % imshow(Ouput_FullEdgeImage);
% % % figure('name','Sumation : Full Edge Image and Get close Image')
% % % imshow(Ouput_Sum_FullEdgeAndMethod1);
% % % figure('name','MedFilter to Sumation')
% % % imshow(Ouput_Sum_FullEdgeAndMethod1_Medfilt);
% figure('name','Sumation_nPS(nPSEdgeByFuzzyandThreshold')
% imshow(Output_nPS_sum);
% figure('name','Sumation_nPS_filter(nPSEdgeByFuzzyandThreshold')
% imshow(Output_nPS_sum_filr);

% figure;
% imshow(Output2);
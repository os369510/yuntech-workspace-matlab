% close all;clear all;clc;
function Output=GetFullEdgeImage();
% Image Transmit
Input_nPS=imread('0701-10-1.bmp');
Input_nPS=Input_nPS(201:800,:);
Input=imread('0701-10-1_FindEdge_PS1.bmp');

Input=rgb2gray(Input);
Input=Input(201:800,:);
% Parameter Initialize
kernel_Horizontal_Lower2Upper=[-1 -1 -1 ; 0 0 0 ; 1 1 1];
kernel_Horizontal_Upper2Lower=[1 1 1 ; 0 0 0 ; -1 -1 -1];
kernel_Vertical_Right2Left=[-1 0 1 ; -1 0 1 ; -1 0 1];
kernel_Vertical_Left2Right=[1 0 -1 ; 1 0 -1 ; 1 0 -1];
kernel_Sobel_Horizontal_Lower2Upper=[-1 -2 -1 ; 0 0 0 ; 1 2 1];
kernel_Sobel_Horizontal_Upper2Lower=[1 2 1 ; 0 0 0 ; -1 -2 -1];
kernel_Sobel_Vertical_Right2Left=[-1 0 1 ; -2 0 2 ; -1 0 1];
kernel_Sobel_Vertical_Left2Right=[1 0 -1 ; 2 0 -2 ; 1 0 -1];
kernel_Laplace=[0 -1 0 ; -1 4 -1 ; 0 -1 0];

% Low-Pass filter
% Input_LPF=imfilter(Input,[1 1 1;1 1 1;1 1 1;]/9);

%Differential (Edge close to white , compare with Sobel)
Output_Differential_H_L2U=imfilter(Input,kernel_Horizontal_Lower2Upper);
Output_Differential_H_U2L=imfilter(Input,kernel_Horizontal_Upper2Lower);
Output_Differential_V_R2L=imfilter(Input,kernel_Vertical_Right2Left);
Output_Differential_V_L2R=imfilter(Input,kernel_Vertical_Left2Right);
% % %Sobel (Edge close to black)
% Output_Sobel_H_L2U=imfilter(Input,kernel_Sobel_Horizontal_Lower2Upper);
% Output_Sobel_H_U2L=imfilter(Input,kernel_Sobel_Horizontal_Upper2Lower);
% Output_Sobel_V_R2L=imfilter(Input,kernel_Sobel_Vertical_Right2Left);
% Output_Sobel_V_L2R=imfilter(Input,kernel_Sobel_Vertical_Left2Right);

Output_Differential=Output_Differential_H_L2U+Output_Differential_V_R2L;%Output_Differential_H_U2L+Output_Differential_V_L2R+
% Output_Sobel=Output_Sobel_H_L2U+Output_Sobel_V_R2L;%Output_Differential_H_U2L+Output_Differential_V_L2R+

% Threshold
Output_Diff_Thres=im2bw(Output_Differential,50/255);

% Medfilter
Output_Diff_Thres_Medfilr=medfilt2(Output_Diff_Thres,[3,3]);
Output_Diff_Thres_Medfilr=medfilt2(Output_Diff_Thres_Medfilr,[3,3]);
Output_Diff_Thres_Medfilr=medfilt2(Output_Diff_Thres_Medfilr,[3,3]);
Output_Diff_Thres_Medfilr=medfilt2(Output_Diff_Thres_Medfilr,[3,3]);
Output_Diff_Thres_Medfilr=medfilt2(Output_Diff_Thres_Medfilr,[3,3]);

Output=not(Output_Diff_Thres_Medfilr);

% Output_Diff_Thres_Dilate=imdilate(Output_Diff_Thres,[1 1 1 ; 1 1 1 ; 1 1 1 ;]); %[0 1 0 ; 1 1 1 ; 0 1 0 ;]
% 
% Output_Diff_Thres_Erode=imerode(Output_Diff_Thres_Dilate,[1 1 1 ; 1 1 1 ; 1 1 1 ;]);

% Output_Differential_H=imfilter(Output_Differential,kernel_Horizontal);
% Output_Differential_V=imfilter(Output_Differential,kernel_Vertical);
% 
% Output_Differential=Output_Differential_H+Output_Differential_V;

% Ouput_DoubleDiff=imfilter(Input,kernel_Laplace);

% % % % % figure('name','Original Image');
% % % % % imshow(Input_nPS);
% % % % % figure('name','PS Image');
% % % % % imshow(Input);
% % % % % % figure('name','Low-Pass Filter');
% % % % % % imshow(Input_LPF);
% % % % % figure('name','Differential');
% % % % % imshow(Output_Differential);
% % % % % figure('name','Threshold 50 after Differential');
% % % % % imshow(Output_Diff_Thres);
% % % % % figure('name','MedFilter after Threshold and Differential');
% % % % % imshow(Output_Diff_Thres_Medfilr);
% % % % % % figure('name','Dilation after Threshold 50 and Differential');
% % % % % % imshow(Output_Diff_Thres_Dilate);
% % % % % % figure('name','Erosion after Dilation , Threshold 50 and Differential');
% % % % % % imshow(Output_Diff_Thres_Erode);

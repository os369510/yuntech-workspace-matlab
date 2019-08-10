 close all;clear all;clc;
 % 96 : 5:100 1
 % 98 : 1
 % 99 : 2
% level=20;
%材料顏色和膠帶顏色
m_index=0;
b_index=1;

%縱向起始檢測位址和結束位址
first=0;
last=1500;
length=last-first;

%橫向起始檢測位址和結束位址
width_first=200;
width_last=7092;

%影像寬度
im_width=7392;
im_half_width=im_width/2;

%讀入影像
% x=imread('95A1814AC__2__1.bmp');
x=imread('1.bmp');
x=rgb2gray(x);
figure;
hist(sum(x(:,:))/1500,linspace(0,255,7392));
%filter資訊
k=11;
kernel=ones(k,1)/k;
p_filter1=imfilter(x,kernel);

%  p_filter1=sum(p_filter1((211:215),:))/5; %626 1119
% p_filter1=sum(p_filter1((624:628),:))/5; % 213 626 1119
%  p_filter1=sum(p_filter1((1117:1121),:))/5; %626 1119
 p_filter1=sum(p_filter1(:,:))/length; %626 1119
 
kernel_2=[-1 0 1];
kernel_3=[1 0 -1];
p_filter2=imfilter(p_filter1,kernel_2);
% p_filter3=imfilter(p_filter1,kernel_3);
p_filter4=abs(p_filter2);
% pf4_sum=sum(p_filter4(:,:))/length;
% pf4_sum=uint8(pf4_sum);
pf4_sum=(p_filter4);

figure('Name','Origin','NumberTitle','off');
imshow(x);
figure('Name','filter1','NumberTitle','off');
imshow(p_filter1);
figure('Name','filter2','NumberTitle','off')
imshow(p_filter2);
% figure('Name','filter3','NumberTitle','off')
% imshow(p_filter3);
% figure('Name','filter2_threshold','NumberTitle','off')
% p_filter2_threshold=im2bw(p_filter2,5/255);
% imshow(p_filter2_threshold);
% figure('Name','p_filter2_histogram','NumberTitle','off')
% plot(p_filter2(200,:));
% axis tight;
% figure('Name','p_filter3_histogram','NumberTitle','off')
% plot(p_filter3(200,:));
% axis tight;
figure('Name','p_filter4_sum','NumberTitle','off')
plot(pf4_sum);
axis tight;

figure('Name','p_filter4_sum_conv','NumberTitle','off')
plot(conv(pf4_sum,ones(1,7)/7));
axis tight;

a=conv(pf4_sum,ones(1,7)/7);
a=a(4:7395);
c=a;
for i=1:1:7392
    c(i)=(pf4_sum(i)-a(i))>5;
end
figure('Name','p_filter4_sum_conv2','NumberTitle','off')
plot(c);
axis tight;

% le2=graythresh(p_filter2(200,:));
% le3=graythresh(p_filter3(200,:));
% % % % % level4=graythresh(pf4_sum);
% % % % % % figure('Name','p_filter2_histogram_ot','NumberTitle','off')
% % % % % % plot(im2bw(p_filter2(200,:),le2));
% % % % % % axis tight;
% % % % % figure('Name','p_filter4_sum_ot','NumberTitle','off')
% % % % % plot(im2bw(pf4_sum,level4));
% % % % % axis tight;


% 
% %threshold Value
% % level1=15;
% level2=graythresh(p_filter1);
% 
% %膠帶與中心點標準距離(mm)
% % array_rd=[35.223,32.95,25.35,20.75,13.15,10.877];
% array_rd=[16.16];
% array_rd=[-array_rd , fliplr(array_rd)];
% 
% %每pixel長度(mm)
% ppd=0.014;
% 
% %膠帶與中心點標準距離(pixel)
% array_rp=array_rd/ppd;
% 
% %上方為設定資訊
% %============================================================
% 
% % x_otsu1=im2bw(x,level1/255);
% % x_otsu2=im2bw(x,level2/255);
% 
% figure('Name','Origin','NumberTitle','off')
% imshow(x);
% figure('Name','Filter1','NumberTitle','off')
% imshow(p_filter1);
% figure('Name','Filter2','NumberTitle','off')
% imshow(p_filter2);
% %Otsu
% x_otsu=im2bw(p_filter1,level2);
% 
% %Initialize 材料邊緣的位址 (pixel)
% edge_location=zeros(length,2);
% 
% %此為找尋材料邊緣 (pixel)
% % find edge location (pixel)
% for i=1:1:length
%     first_color=[x_otsu(i+first,width_first),x_otsu(i+first,width_last)];
%     for l=1:1:2
%         for k=width_first:1:im_half_width
%             if(l==1)
%                 if(x_otsu(i+first,k)~=first_color(1))
%                     edge_location(i,l)=k;
%                     break;
%                 end
%             end
%             if(l==2)
%                 if(x_otsu(i+first,im_width+1-k)~=first_color(2))
%                     edge_location(i,l)=im_width-k;
%                     break;
%                 end
%             end
%         end
%     end
% end
% 
% level2=graythresh(p_filter1(:,(min(edge_location(:,1)):max(edge_location(:,2)))));
% x_otsu=im2bw(p_filter1,level2);
% figure('Name','Otsu','NumberTitle','off')
% imshow(x_otsu);
% 
% %此為找尋材料中心位址 (pixel)
% % find middle location (pixel)
% middle=zeros(1,length);
% for i=1:1:length
%     middle(i)=(edge_location(i,1)+edge_location(i,2))/2;
% % %     checksize=zeros(1,10);
% % %     if(i>10)
% % %         checksize=middle(i-10:i-1);
% % %         if(abs(middle(i)-mean(checksize))>=1)
% % %             middle(i)=middle(i-1);
% % %         end
% % %     end
% end
% % % % % 
% % find Tape location (pixel)
% % array=[1560,1850,2340,2640,3130,3410,3886,4615,5105,5400,5890,6200];
% 
% %材料中心點位移
% middle=middle;
% % middle=3752;
% 
% %此為找尋膠帶邊緣設定
% array=array_rp;
% array=int32(array);
% array_size=size(array);
% array_length=array_size(2);
% distance_location=zeros(length,array_length);
% find_location=0;
% 
% %此為找尋膠帶邊緣 (pixel)
% index=0;
% for l=1:1:length
%     for i=1:1:array_length
%         %當在找尋任一膠帶邊緣時，第一次找尋皆由左往右找，找尋膠帶左側邊緣
%         if(mod(i,2)==1)
%             find_location=middle(i)+array(i)-200;
%             
%             for k=find_location:1:find_location+400
%                 if(x_otsu(l+first,k)==b_index)
%                     distance_location(l,i)=k-1;
%                     break;
%                 end
%             end
%         end
%         %當在找尋任一膠帶邊緣時，第一次找尋皆由右往左找，找尋膠帶右側邊緣
%         if(mod(i,2)==0)
%             find_location=middle(i)+array(i)+200;
%             
%             for k=find_location:-1:find_location-400
%                 if(x_otsu(l+first,k)==b_index)
%                     distance_location(l,i)=k+1;
%                     break;
%                 end
%             end
%         end
%     end
% end
% 
% %(各膠帶邊緣與中心點距離) (pixel)
% distance_tolerance_pixel=zeros(length,array_length);
% for l=1:1:length
%     distance_tolerance_pixel(l,:)=abs(middle(l)-distance_location(l,:));
% end
% 
% %兩側(各膠帶邊緣與中心點距離)相減 (pixel)
% rl_tolerance_pixel=zeros(length,array_length/2);
% for l=1:1:length
%     for i=1:1:array_length/2
%         rl_tolerance_pixel(l,i)=distance_tolerance_pixel(l,i)-distance_tolerance_pixel(l,array_length+1-i);
%     end
% end
% 
% %(各膠帶邊緣與中心點距離)轉換回mm
% distance_tolerance_mm=distance_tolerance_pixel*0.014;
% 
% %各膠帶邊緣與標準膠帶邊緣之差
% for l=1:1:length
%     for i=1:1:array_length
%         distance_tolerance_real_pixel(l,i)=distance_tolerance_pixel(l,i)-abs(array(i));
%     end
% end
% 
% %各膠帶寬度(pixel)
% tape_width_pixel=zeros(length,array_length/2+1);
% for l=1:1:length
%     for i=1:1:array_length/2+1
%         if(i==1)
%             tape_width_pixel(l,i)=abs(distance_location(l,1)-edge_location(l,1));
%         end
%         if(i==array_length/2+1)
%             tape_width_pixel(l,i)=abs(distance_location(l,array_length)-edge_location(l,2));
%         end
%         if(i>1 && i<array_length/2+1)
%             tape_width_pixel(l,i)=abs(distance_location(l,(i-1)*2+1)-distance_location(l,(i-1)*2));
%         end
%     end
% end
% 
% %各膠帶以外寬度(pixel)
% % without_tape_width_pixel=zeros(length,array_length/2);
% % for l=1:1:length
% %     for i=1:1:array_length/2
% %         without_tape_width_pixel(l,i)=abs(distance_location(l,(i*2+1))-distance_location(l,(i*2)));
% %     end
% % end
% 
% % % % % 
% % % % % %find check value (pixel)
% % % % % distance_pixel=zeros(length:array_length);
% % % % % for l=1:1:length
% % % % %     for i=1:1:array_length
% % % % %         distance_pixel(l,i)=abs(middle(l)-distance_location(l,i));
% % % % %     end
% % % % % end
% % % % % 
% % % % % % find tape length (pixel)
% % % % % distance_length=zeros(length:array_length/2);
% % % % % for i=1:1:array_length/2
% % % % %     for l=1:1:length
% % % % %         distance_length(l,i)=abs(distance_location(l,2*i)-distance_location(l,(2*i-1)));
% % % % %         if (l>10)
% % % % %             checksize=zeros(1,10);
% % % % %             checksize=distance_length(l-10:l-1,i);
% % % % %             if(abs(distance_length(l,i)-mean(checksize))>=2)
% % % % %                 distance_length(l,i)=distance_length(l-1,i);
% % % % %             end
% % % % %         end
% % % % %     end
% % % % % end
% % % % % 
% % % % % % find error
% % % % % distance=zeros(length:array_length);
% % % % % distance=distance_pixel.*14.80986/1e6; % transfor distance(um)
% % % % % distance_standard=[34.17,29.81,22.59,18.20,10.95,6.59,6.54,10.92,18.15,22.54,29.76,34.14]/1e3;
% % % % % distance_error=zeros(length:array_length);
% % % % % for l=1:1:length
% % % % %     distance_error(l,:)=(distance(l,:)-distance_standard)*1e6;
% % % % % end
% % % % % for l=1:1:length
% % % % %     for i=1:1:array_length
% % % % %         checksize=zeros(1,10);
% % % % %         if(l>10)
% % % % %             checksize=distance_error(l-10:l-1,i);
% % % % %             if(abs(distance_error(l,i)-mean(checksize))>=10)
% % % % %                 distance_error(l,i)=distance_error(l-1,i);
% % % % %             end
% % % % %         end
% % % % %     end
% % % % % end
% % % % % 
% % % % % %find max min and average
% % % % % distance_error_average=zeros(1,array_length);
% % % % % distance_error_max=zeros(1,array_length);
% % % % % distance_error_min=zeros(1,array_length);
% % % % % for i=1:1:array_length
% % % % %     for l=1:1:length
% % % % %         distance_error_average(i)=distance_error_average(i)+(distance_error(l,i)/length);
% % % % %     end
% % % % %     distance_error_max(i)=max(distance_error(:,i));
% % % % %     distance_error_min(i)=min(distance_error(:,i));
% % % % % end
% % % % % 
% % % % % % calibration
% % % % % for i=1:1:array_length
% % % % %     distance_error(:,i)=distance_error(:,i)-distance_error_average(i);
% % % % % end
% % % % % 
% % % % % %find tape length error
% % % % % distance_length_standard=[abs(distance_standard(1)-distance_standard(2)),abs(distance_standard(3)-distance_standard(4)),abs(distance_standard(5)-distance_standard(6)),abs(distance_standard(7)-distance_standard(8)),abs(distance_standard(9)-distance_standard(10)),abs(distance_standard(11)-distance_standard(12))];
% % % % % distance_length_error=zeros(length:array_length/2);
% % % % % 
% % % % % for i=1:1:array_length/2
% % % % %     distance_length(:,i)=distance_length(:,i)*14.80986/1e6;
% % % % %     distance_length_error(:,i)=(distance_length(:,i)-distance_length_standard(i))*1e6;
% % % % % end
% % % % % 
% % % % % % find tape length max min and average
% % % % % distance_length_error_average=zeros(1,array_length/2);
% % % % % distance_length_error_max=zeros(1,array_length/2);
% % % % % distance_length_error_min=zeros(1,array_length/2);
% % % % % for i=1:1:array_length/2
% % % % %     for l=1:1:length
% % % % %         distance_length_error_average(i)=distance_length_error_average(i)+(distance_length_error(l,i)/length);
% % % % %     end
% % % % %     distance_length_error_max(i)=max(abs(distance_length_error(:,i)));
% % % % %     distance_length_error_min(i)=min(abs(distance_length_error(:,i)));
% % % % % end
% % % % % 
% % % % % % find tape length calibration
% % % % % for i=1:1:array_length/2
% % % % %     distance_length_error(:,i)=distance_length_error(:,i)-distance_length_error_average(i);
% % % % % end
% 
% 
% % max(distance_error_average)
% %2925
%         
% % x_otsu=double(x_otsu);
% % x_otsu=imrotate(x_otsu,0.125);
% % x_label=bwlabel(x_otsu,4);
% % x_reg=regionprops(x_label,'Centroid');%'BoundingBox');
% 
% 
% % % % % y=x_otsu2;
% 
% figure('Name','DrawEdge','NumberTitle','off')
% imshow(p_filter1);
% hold on;
% for l=1:1:length
%     plot(edge_location(l,1),l,'r-');
%     plot(edge_location(l,2),l,'r-');
%     for i=1:1:array_length
%         plot(distance_location(l,i),l,'b-');
%     end
% end
% imwrite(p_filter1,'Filter.bmp');
% imwrite(x_otsu,'Otsu.bmp');
% % edge_location(395,2)-edge_location(395,1)
% 
% % y label = 3860
% % x = 666 b     , 667 w
% % x = 2509 w    , 2510 b
% % x = 3117 b    , 3118 w
% % x = 4356 w    , 4357 b
% % x = 4969 b    , 4970 w
% % x = 6727 w    , 6728 b
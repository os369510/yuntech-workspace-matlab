ss=imread('2014_3_28.bmp');
ss=fliplr(ss);
ss=imrotate(ss,1.4581); 
imwrite(ss,'ss.bmp');
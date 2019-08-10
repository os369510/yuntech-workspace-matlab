function Output=sCurveImage(Input,th)
% Input is Image pixel value 
% output is Return value
Output=double(Input).^th;
maxValue=max(Output(:));
Output=255*Output./maxValue;
Output=uint8(Output);
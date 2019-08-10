function Output=sCurve(Input,th)
% Input is Image pixel value 
% output is Return value
maxValue=max(255^th);
c=255/maxValue;
Output=c*double(Input)^th;


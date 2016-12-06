function image_bigedge = getbigedge(image,num)
% 此函数主要有两个功能：
% 1.将边缘提取后的图片进行膨胀化处理，使物体边缘尽可能完整，不会有中断。
% 2.将连通域小于num的边缘区域消除（即消除图像中的小物品）。
% image             边缘提取后的二值图片
% num               面积值，小于该数值的区域将会被消除
% image_bigedge     膨胀化和消除小物品之后的边缘图片

% 使用方形结构
SE=strel('square',2);
% 采用方形结构对图片进行膨胀
temp=imdilate(image,SE);
%消除连通域小于num的边缘区域
image_bigedge=bwareaopen(temp,num);

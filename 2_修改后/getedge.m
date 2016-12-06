function image_edge = getedge(image)
% 此函数有两个功能：
% 1.将读入图像进行二值化处理，主要为了突出图片中硬度物品。
% 2.将得到的二值图片进行边缘提取。
% image         RGB格式的输入图像
% image_edge    边缘提取后得到的二值化图像
R=image(:,:,1);
% 设置阈值
T=80/255;
% 根据阈值对灰度图片进行二值化处理
temp=im2bw(R,T);
% 对二值化图像进行边缘提取
image_edge=bwmorph(temp,'remove');



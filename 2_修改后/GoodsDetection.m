function GoodsDetection (Image)
%该程序是用于安检图片危险物品的检测。
%当图片中有与数据库一样的危险物品时，程序输入字符有危险物品。
%当图片中没有与数据一样的危险物品但有形状又过大的硬度物品时，程序会显示图片。
%当图片中没有与数据库一样的危险物品也没有形状过大的硬度物品时，程序不做任何操作。
%Image      传入需要检测的安检图像


% 获取图片边缘
r1=getedge(Image);
% 获取去除小区域的图片
r2=getbigedge(r1,300);
% 对不同连通域进行标记
[L,num]=bwlabel(r2,8);
% 分割出不同连通域的物体图片
s=regionprops(L,'Image');

if(num<2)
%     程序终止

end
% 是否检测出危险物品的标记置0
temp=0;
% 
% axes(handles.axes_dst);
for i=2:num
%     检测是否有与数据库相似的危险物品
    num_isdanger=isdanger(s(i).Image);
%     有与数据库相似的危险物品，直接跳出循环
    if(num_isdanger~=0)
%         是否检测出危险物品的标记置1
        temp=temp+1;
        imshow(Image);
        title('检测出有危险物品');
        msgbox('可能有危险物品','提示','warn');
        break;
    end
end
% 没有检测出与数据库相似的危险物品，显示原图，由人工去检测
if(temp==0)
    imshow(Image);
    title('人工检测');
end

        
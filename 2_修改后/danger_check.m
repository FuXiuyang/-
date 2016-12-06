function O = danger_check(I)

I = double(I);
M = double(M);
% 获取图片边缘
r1=getedge(I);
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
    figure,
    imshow(Image);
    title('人工检测');
     msgbox('没有危险物品','提示');
end

        
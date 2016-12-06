 function num_isdanger = isdanger(image)
%   此函数的功能是将图片与数据库中的危险物品做比较
%   相似，则输出字符，提示有危险物品，并且返回num_isdanger为1
%   不相似，这返回num_isdanger为0
%   image           输入一个需要和数据库比较的物体图像
%   num_isdanger    输出1说明该物体是危险物体，输出0说明该物体不是数据库中的危险物体
for i=1:1:2
    pathname=strcat('danger\危险图片\',num2str(i),'.tiff');
    temp=imread(pathname);
%   是否和库内危险物品匹配的标志置0
    num_isdanger=0;
%   旋转0—360度
    for t=0:5:360
%    image图像旋转t度
        temp1=imrotate(image,t,'nearest');
%    iamge图像变成标准的360x480大小的图片
        temp1=imresize(temp1,[360,480],'nearest');
%     求两个矩阵的相似度
        d=corr2(temp,temp1);
%     相似度超过20%，即认为是与该数据库一样的危险物品
        if(d>0.2)
%         输出提示字符串
%             msgbox('可能有危险物品','提示','warn');
%          可以自行设置提示框大小
%           h=msgbox('可能有危险物品','提示','warn');
%           set(h,'position',[100,200,200,100]);
%             是否和库内危险物品匹配的标志置1
%           读取报警声音，并播放该文件
            [y,fs]=wavread('danger\报警声\4031.wav');
            sound(y,fs);
            num_isdanger=num_isdanger+1;
            break;
        end
    end
    if(num_isdanger==1)
        break;
    end
end







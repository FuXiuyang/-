function O = danger_check(I)

I = double(I);
M = double(M);
% ��ȡͼƬ��Ե
r1=getedge(I);
% ��ȡȥ��С�����ͼƬ
r2=getbigedge(r1,300);
% �Բ�ͬ��ͨ����б��
[L,num]=bwlabel(r2,8);
% �ָ����ͬ��ͨ�������ͼƬ
s=regionprops(L,'Image');

if(num<2)
%     ������ֹ

end
% �Ƿ����Σ����Ʒ�ı����0
temp=0;
% 
for i=2:num
%     ����Ƿ��������ݿ����Ƶ�Σ����Ʒ
    num_isdanger=isdanger(s(i).Image);
%     �������ݿ����Ƶ�Σ����Ʒ��ֱ������ѭ��
    if(num_isdanger~=0)
%         �Ƿ����Σ����Ʒ�ı����1
        temp=temp+1;
        imshow(Image);
        title('������Σ����Ʒ');
        msgbox('������Σ����Ʒ','��ʾ','warn');
        break;
    end
end
% û�м��������ݿ����Ƶ�Σ����Ʒ����ʾԭͼ�����˹�ȥ���
if(temp==0)
    figure,
    imshow(Image);
    title('�˹����');
     msgbox('û��Σ����Ʒ','��ʾ');
end

        
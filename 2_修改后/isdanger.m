 function num_isdanger = isdanger(image)
%   �˺����Ĺ����ǽ�ͼƬ�����ݿ��е�Σ����Ʒ���Ƚ�
%   ���ƣ�������ַ�����ʾ��Σ����Ʒ�����ҷ���num_isdangerΪ1
%   �����ƣ��ⷵ��num_isdangerΪ0
%   image           ����һ����Ҫ�����ݿ�Ƚϵ�����ͼ��
%   num_isdanger    ���1˵����������Σ�����壬���0˵�������岻�����ݿ��е�Σ������
for i=1:1:2
    pathname=strcat('danger\Σ��ͼƬ\',num2str(i),'.tiff');
    temp=imread(pathname);
%   �Ƿ�Ϳ���Σ����Ʒƥ��ı�־��0
    num_isdanger=0;
%   ��ת0��360��
    for t=0:5:360
%    imageͼ����תt��
        temp1=imrotate(image,t,'nearest');
%    iamgeͼ���ɱ�׼��360x480��С��ͼƬ
        temp1=imresize(temp1,[360,480],'nearest');
%     ��������������ƶ�
        d=corr2(temp,temp1);
%     ���ƶȳ���20%������Ϊ��������ݿ�һ����Σ����Ʒ
        if(d>0.2)
%         �����ʾ�ַ���
%             msgbox('������Σ����Ʒ','��ʾ','warn');
%          ��������������ʾ���С
%           h=msgbox('������Σ����Ʒ','��ʾ','warn');
%           set(h,'position',[100,200,200,100]);
%             �Ƿ�Ϳ���Σ����Ʒƥ��ı�־��1
%           ��ȡ���������������Ÿ��ļ�
            [y,fs]=wavread('danger\������\4031.wav');
            sound(y,fs);
            num_isdanger=num_isdanger+1;
            break;
        end
    end
    if(num_isdanger==1)
        break;
    end
end







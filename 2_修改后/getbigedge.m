function image_bigedge = getbigedge(image,num)
% �˺�����Ҫ���������ܣ�
% 1.����Ե��ȡ���ͼƬ�������ͻ�����ʹ�����Ե�������������������жϡ�
% 2.����ͨ��С��num�ı�Ե����������������ͼ���е�С��Ʒ����
% image             ��Ե��ȡ��Ķ�ֵͼƬ
% num               ���ֵ��С�ڸ���ֵ�����򽫻ᱻ����
% image_bigedge     ���ͻ�������С��Ʒ֮��ı�ԵͼƬ

% ʹ�÷��νṹ
SE=strel('square',2);
% ���÷��νṹ��ͼƬ��������
temp=imdilate(image,SE);
%������ͨ��С��num�ı�Ե����
image_bigedge=bwareaopen(temp,num);

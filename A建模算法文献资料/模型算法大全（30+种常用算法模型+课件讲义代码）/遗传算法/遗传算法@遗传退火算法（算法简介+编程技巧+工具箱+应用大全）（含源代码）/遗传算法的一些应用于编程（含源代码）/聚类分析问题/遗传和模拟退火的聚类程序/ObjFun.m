function [Jb,center,U]=ObjFun(X,cn,V,options);
%% ������Ⱥ��ÿ�������Ŀ��ֵ
% ����
%        X����������
%       cn��������
%        V�����еĳ�ʼ�������ľ���
%  options��������ָ����������������Ŀ�꺯������ֹ����
% ���
%    Jb���������Ŀ�����
% center���Ż���ĸ�����ľ�������
%      U�������������Ʒ������
[sizepop,m]=size(V);
ch=m/cn;
Jb=zeros(sizepop,1);
center=cell(sizepop,1);
U=cell(sizepop,1);
for i=1:sizepop
    v=reshape(V(i,:),cn,ch);
    [Jb(i),center{i},U{i}]=FCMfun(X,cn,v,options);
end
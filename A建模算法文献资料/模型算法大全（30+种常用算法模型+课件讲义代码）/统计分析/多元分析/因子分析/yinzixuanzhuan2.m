clc,clear 
load r.txt  %��ԭʼ�����ϵ�����󱣴��ڴ��ı��ļ�r.txt�� 
[vec,val,con]=pcacov(r) 
f1=repmat(sign(sum(vec)),size(vec,1),1); 
vec=vec.*f1;     %��������������ת�� 
f2=repmat(sqrt(val)',size(vec,1),1); 
a=vec.*f2   %����ȫ�����ӵ��غɾ��󣬼���40��ʽ 
num=2; %numΪ���ӵĸ��� 
a1=a(:,[1:num])   %����������ӵ��غɾ��� 
tcha=diag(r-a1*a1')   %���ӵ����ⷽ�� 
ccha=r-a1*a1'-diag(tcha)  %��в���� 
gong=cumsum(con(1:num))     %���ۻ������� 
[mat,sv]=factoran(r,2,'xtype','cov','rotate','varimax') 
%����ֵmatΪ��ת�����غɾ���svΪ���ⷽ�� 
 
function [U_new,center,obj_fcn]=iterateFCM(X,U,cluster_n,b)
%% ����
% ����
%        X����������
%        U�����Ʒ������
%cluster_n��������
%        b����ָ��
% ���
%obj_fcn����ǰĿ�����Jbֵ
% center���µĵľ�������
%  U_new�����Ʒ������
mf=U.^b;       % ָ���������mf����
center=mf*X./((ones(size(X,2),1)*sum(mf'))'); % �µľ�������
%% Ŀ��ֵ
dist=distfcm(center,X);       % �������������������ĵľ������
obj_fcn=sum(sum((dist.^2).*mf));  % Ŀ�꺯��ֵ
%% �����µ�U����
tmp=dist.^(-2/(b-1));
U_new=tmp./(ones(cluster_n,1)*sum(tmp));

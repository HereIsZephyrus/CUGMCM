function U=initFCM(X,cluster_n,center,b)
%% ��ʼ�����Ʒ������
% ����
%        X����������
%cluster_n��������
%   center����ʼ�������ľ���
%        b��������ָ��
% ���
%      U�����Ʒ������
dist=distfcm(center,X);       % �������������������ĵľ������
%% �����µ�U����
tmp=dist.^(-2/(b-1));
U=tmp./(ones(cluster_n,1)*sum(tmp));
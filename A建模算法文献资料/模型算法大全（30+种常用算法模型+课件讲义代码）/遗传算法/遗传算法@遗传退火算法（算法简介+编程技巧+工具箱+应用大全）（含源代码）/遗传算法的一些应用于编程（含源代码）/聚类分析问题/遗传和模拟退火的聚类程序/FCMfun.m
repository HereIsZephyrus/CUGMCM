function [obj,center,U]=FCMfun(X,cluster_n,center,options)
%% FCM������
% ����
%        X����������
%cluster_n��������
%   center����ʼ�������ľ���
%  options��������ָ����������������Ŀ�꺯������ֹ����
% ���
%    obj��Ŀ�����Jbֵ
% center���Ż���ľ�������
%      U�����Ʒ������
X_n=size(X,1);
in_n=size(X,2);
b=options(1);		    % ��Ȩ����
max_iter=options(2);		% ����������
min_impro=options(3);		% �������ε�����С�Ľ��������ж��Ƿ���ǰ��ֹ��
obj_fcn=zeros(max_iter,1);	% ��ʼ��Ŀ��ֵ����
U = initFCM(X,cluster_n,center,b);			% ��ʼ���������ƾ���
% ������ѭ��
for i = 1:max_iter,
    [U, center,obj_fcn(i)]=iterateFCM(X,U,cluster_n,b);
    % �˶���ֹ����
    if i > 1
        if abs(obj_fcn(i) - obj_fcn(i-1)) < min_impro, break; end,
    end
end
iter_n = i;	% ��ʵ��������
obj_fcn(iter_n+1:max_iter)=[];
obj=obj_fcn(end);



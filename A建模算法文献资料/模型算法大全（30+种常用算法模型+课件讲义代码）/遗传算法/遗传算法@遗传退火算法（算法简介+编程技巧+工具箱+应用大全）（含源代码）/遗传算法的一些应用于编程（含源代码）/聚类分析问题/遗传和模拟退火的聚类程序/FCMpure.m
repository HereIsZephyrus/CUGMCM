%% 1�����������ʼ��������
% clc;
clear
%% ��������
load X
figure
plot(X(:,1),X(:,2),'o')
xlabel('������X');ylabel('������Y');title('��������')
hold on
%% ����ģ��C��ֵ����
% ������ָ��Ϊ3������������Ϊ20��Ŀ�꺯������ֹ����Ϊ1e-6
options=[3,20,1e-6,0];
% ����fcm��������ģ��C��ֵ���࣬�����������������center�������Ⱦ���U��Ŀ�꺯��ֵobj_fcn
cn=4; %������
[center,U,obj_fcn]=fcm(X,cn,options);
Jb=obj_fcn(end)
maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2, :) == maxU);
index3 = find(U(3, :) == maxU);
%% �������
% ��ǰ�������������зֱ��ϲ�ͬ�Ǻ� ���ӼǺŵľ��ǵ�������
line(X(index1,1), X(index1, 2), 'linestyle', 'none', 'marker', 'x', 'color', 'g'); 
line(X(index2,1), X(index2, 2), 'linestyle', 'none', 'marker', '*', 'color', 'r');
line(X(index3,1), X(index3, 2), 'linestyle', 'none', 'marker', '+', 'color', 'b');
%% ������������
plot(center(:,1),center(:,2),'v')
hold off
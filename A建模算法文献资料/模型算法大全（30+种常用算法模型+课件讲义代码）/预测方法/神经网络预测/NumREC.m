function NumREC
clear all
clc

pr=[0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1];
net=newp(pr,4);

p=[0 1 0 1 1 0 0 1 0 0 1 0 1 1 1;
    1 1 1 0 0 1 1 1 1 1 0 0 1 1 1;
    1 1 1 0 0 1 1 1 1 0 0 1 1 1 1
    1 0 1 1 0 1 1 1 1 0 0 1 0 0 1]';

t=eye(4);

[net,tr]=train(net,p,t);
iw1=net.IW{1}    %���Ȩֵ
b1=net.b{1}      %�����ֵ
epoch1=tr.epoch  %���ѵ�����̾����Ĳ���
perf1=tr.perf    %���ÿһ��ѵ����������

save net32 net
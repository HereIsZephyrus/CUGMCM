function  [B,len,v]=B2F(sol,bounds)
%[B,len]=B2F(x,bounds)    �����Ʊ��뺯��
%x                        ����������x=[6 8 9];
%bounds                   �߽�Լ��ru��bounds=[4 8 ;3  11;6  12;];
%B                        �����Ʊ��봮
%���볤��L��bounds(2)-bounds(1)����
%����Ϊ��:
%     ���볤������L=[4 8 6]��ɶ�����L=[11 1000 110],��len=[2 4 3]
%     ����B=x-bound(1)=[2 5 3]��ɶ����� B=[10 0101 011]
%           ���ߣ�����01-2�����º�
%           zxh21st@163.com
n=length(sol);
len=[];B=[];v=[];
L=bounds(:,2)-bounds(:,1);
L=de2bi(L);
for i=1:n
len(i)=length(L(i,:));
end
v=sol-bounds(:,1)';
for i=1:n
    B=[B de2bi(v(i),len(i))];
end

function [pop]=INTinti(num,bounds)
%[pop]=INTinti(num,bounds)
%inti     ���뺯��
%num      ��Ⱥ��
%bounds   �߽�Լ��
%           ���ߣ�����01-2�����º�
%           zxh21st@163.com
n=size(bounds,1);
L=bounds(:,2)-bounds(:,1);
p=rand(num,n);
for i=1:num
    p(i,:)=round(p(i,:).*L');
    pop(i,:)= p(i,:)+bounds(:,1)';
    f(i)=myfun(pop(i,:));
end
pop=[pop f'];
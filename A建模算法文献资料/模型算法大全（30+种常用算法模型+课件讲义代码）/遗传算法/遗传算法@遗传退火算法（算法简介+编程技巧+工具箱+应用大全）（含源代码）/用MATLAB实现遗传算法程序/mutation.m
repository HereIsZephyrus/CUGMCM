function [child]=mutation(pop)
%���ƺ�������ȡС����ת��
%[child]=mutation(pop)
%mutation    ����
%pop         ��ʼ��Ⱥ
%child       ���ظ��ƺ����Ⱥ
%pop(:,end)  ��ֵ��
%           ���ߣ�����01-2�����º�
%           zxh21st@163.com
[n,m]=size(pop);
f=pop(:,end);
value=sum(f);
for i=1:n
    p(i)=f(i)/value;
    q(i)=sum(p(1:i));
end
    t=rand(1,n);
for j=1:n
    for k=1:n
        if t(j)<q(k)
            v(j)=k;
            break
        end
    end
end
    i=1:n;
    child(i,:)=pop(v(i),:);



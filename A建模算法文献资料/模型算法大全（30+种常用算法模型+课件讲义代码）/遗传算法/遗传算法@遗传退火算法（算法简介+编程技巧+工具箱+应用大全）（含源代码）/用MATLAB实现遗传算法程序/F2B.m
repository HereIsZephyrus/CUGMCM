function  [pops,len]=F2B(x,bounds,len)
%�����Ʊ���ת��Ϊʮ����
%[pops]=F2B(x,bounds,len)
%x       �����ƴ���x=[0 1 1  0 0 1 0  1 0 1 0 1]
%len     �����ƴ��ķֶ�len=[3  4  5]
%bounds  �߽�Լ��
%pops    ʮ����
%           ���ߣ�����01-2�����º�
%           zxh21st@163.com
n=length(x);
m=length(len);
q=[];
for i=1:m
q(i)=sum(len(1:i));
end
q=[0 q];
for j=1:m
    pops(j)=bounds(j,1);
    p=[];
    p=x(q(j)+1:q(j+1));
    L1=q(j+1)-q(j);
    for k=1:L1
        pops(j)=pops(j)+p(k)*2^(k-1);
    end
end

    



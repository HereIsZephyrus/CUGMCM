function [pops]=changes(cpop,bounds,len,p)
%����ͻ�亯��
%function [pops]=changes(pop,bounds,len,p)
%pop        ��Ⱥ��Ŀ
%bounds     �߽�Լ��
%len        ÿ�������ı��볤��
%           ��lenΪ[4 3 3];��ʾ��������������һ�������Ķ����Ʊ��볤��Ϊ4,��������
%p          ͻ�����
%pops       ����ͻ���Ļ���
%p1         ����ͻ����Ŀ
%           ���ߣ�����01-2�����º�
%           zxh21st@163.com
if isempty(p)
    p=0.01;
end
[n,m]=size(cpop);
pop=cpop;
p1=round(sum(len)*n*p);
k=0;q=[];v=[];
while(k<p1)
    k=k+1;
    q(k)=round(rand*(sum(len)*n-1))+1;
    for i=1:k-1
        if q(k)==q(i)
            q(k)=[];
            k=k-1;
        end
    end
end

for i=1:n
[B(i,:),len]=B2F(pop(i,:),bounds);
end

v=reshape(B,1,n*sum(len));

for i=1:p1
    if v(q(i))==0
        v(q(i))=1;
    else
        v(q(i))=0;
    end
end
v=reshape(v,n,sum(len));
for i=1:n
   pop(i,:)=F2B(v(i,:),bounds,len);
end
pops=pop
cpop

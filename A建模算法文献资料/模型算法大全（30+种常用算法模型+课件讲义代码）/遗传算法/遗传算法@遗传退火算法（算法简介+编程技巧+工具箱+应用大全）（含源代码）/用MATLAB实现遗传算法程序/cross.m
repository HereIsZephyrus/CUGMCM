function  [cpop ,len,v]=cross(child,bounds,CP)
%���溯������ȡ�㽻��
%[newpop ,len]=cross(child,bounds,CP)
%child      ���ƺ����Ⱥ
%bounds     �߽�Լ��
%CP         �������
%newpop     ����������Ⱥ
%len        ÿ�������ı��볤��
%           ��len����Ϊ[4 3 3];��ʾ��������������һ�������Ķ����Ʊ��볤��Ϊ4,��������
%           ���ߣ�����01-2�����º�
%           zxh21st@163.com
if isempty(CP)
    CP=0.25;
end
[n ,m]=size(child);
B=[];len=[];t=[];
mychild=child(:,1:end-1);
v=[];
p=rand(1,n);
k=1;
    for i=1:n
        if p(i)<CP
            v(k)=i;
            k=k+1;
        end
    end
    if (rem(k,2)==0)
        temp=v(k-1);
        while (temp==v(k-1))
        temp=round(rand*(n-1))+1;
    end
    v(k)=temp;
    k=k+1;
   end 
if isempty(v)
    [B(i,:),len]=B2F(mychild(1,:),bounds);
    B=[];
else
    for i=1:k-1
[B(i,:),len]=B2F(mychild(v(i),:),bounds);
end
for i=1:2:k-2
    p2=round(rand*sum(len)-1)+1;
    t=zeros(1,p2);
    t(i,:)=B(i,1:p2);
    B(i,1:p2)=B(i+1,1:p2);
    B(i+1,1:p2)=t(i,:);
end
for i=1:k-1
   mychild(v(i),:)=F2B(B(i,:),bounds,len);
end
end
cpop=mychild;





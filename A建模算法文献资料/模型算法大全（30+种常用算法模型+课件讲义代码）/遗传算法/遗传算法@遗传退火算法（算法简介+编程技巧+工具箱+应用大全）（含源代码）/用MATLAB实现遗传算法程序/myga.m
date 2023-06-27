function [f,x]=myga(num,bounds,N,CP,P)
%[f,x]=ga(num,bounds,fun,N,CP,P) 
%[f,x]=myga([],bounds,[],[],[])
%���Ŵ��㷨�����ڣ�
%           Ŀ�꺯��Ϊ�����ֵ���ҽ�Ǹ�������
%bounds     �߽�Լ��
%Myfun      ΪĿ�꺯��
%num        ��ʼ��Ⱥ��
%N          ����������
%CP         �������
%P          ͻ�����
%f          Ŀ�����Ž�
%x          ���Ž�����
%           ���ߣ�����01-2�����º�
%           zxh21st@163.com
m=nargin;
if m<5
disp('-_-  ����!')
disp('>> �������̫��')
disp('>>  ���س����鿴����')
    pause
    help ga
    f='-_- ';
    x='û�й�ز��ɷ�Բ';
    break;
end
if isempty(CP)
    CP=0.25;
end
if isempty(P)
    P=0.01;
end
if isempty(N)
    N=1000;
end
if any(bounds(:,1))<0
    disp('-_-  ����!')
disp('>>  ���س����鿴����')
    pause
    help ga
    f='-_- ';
    x='û�й�ز��ɷ�Բ';
    break;
end
if isempty(num)
    num=100;
end
pop=INTinti(num,bounds);
fmax=pop(:,end);
endpop=pop;
n=size(endpop,2);
count=0;x=[];f=zeros(1,num);
while(count<N)
    pop=mutation(endpop);
    [cpop ,len,v]=cross(pop,bounds,CP);
    [pops]=changes(cpop,bounds,len,P);
    for i=1:num
        sol=pops(i,:);
    [f(i)]=Myfun(sol);
    %�ͷ�����
for jj=1:length(sol)
    if sol(jj)<bounds(jj,1)
        f(i)=-inf;
    end
    if sol(jj)>bounds(jj,2)
        f(i)=-inf;
    end
end
            if fmax(i)<f(i)
            fmax(i)=f(i);
            endpop(i,1:end-1)=pops(i,:);
        end
end
endpop(:,end)=fmax(:);
count=count+1;

% [f,ii]=max(fmax);
% x=endpop(ii,1:end-1);
end
[f,ii]=max(fmax);
x=endpop(ii,1:end-1);

function [f,x]=myga(num,bounds,Myfun,N,CP,P)
%[f,x]=ga(num,bounds,fun,N,CP,P)
%���Ŵ��㷨�����ڣ�
%           Ŀ�꺯��Ϊ�����ֵ���ҽ�Ǹ�������
%bounds     �߽�Լ��
%Myfun        ΪĿ�꺯��
%num        ��ʼ��Ⱥ��
%N          ����������
%CP         �������
%P          ͻ�����
%f          Ŀ�����Ž�
%x          ���Ž�����
%           ���ߣ�����01-2�����º�
%           zxh21st@163.com
m=nargin;
if m<6
disp('-_-  ����!')
disp('>> �������̫��')
disp('>>  ���س����鿴����')
    pause
    help ga
    f='-_- ';
    x='û�й�ز��ɷ�Բ';
    break;
end
pop=INTinti(num,bounds);
fmax=pop(:,end);
endpop=pop;
n=size(endpop,2);
k=0;x=[];f=zeros(1,num);
while(k<N)
    pop=mutation(endpop);
    [cpop ,len,v]=cross(pop,bounds,CP);
    [pops]=changes(cpop,bounds,len,P);break;
    for i=1:num
        sol=pops(i,:);
        [f(i)]=Myfun(sol);
        if fmax(i)<f(i)
            fmax(i)=f(i);
            endpop(i,1:end-1)=pops(i,:);
        end
end
endpop(:,end)=fmax(:);
k=k+1;
end
[f,ii]=max(fmax);
x=endpop(ii,1:end-1);

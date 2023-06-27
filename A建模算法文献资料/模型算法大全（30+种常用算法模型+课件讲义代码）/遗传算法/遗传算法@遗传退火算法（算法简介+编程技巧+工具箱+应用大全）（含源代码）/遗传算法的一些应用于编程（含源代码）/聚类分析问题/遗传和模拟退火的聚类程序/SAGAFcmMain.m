%% 2���Ŵ�ģ���Ż���ʼ��������
clc
clear all
close all
load X
m=size(X,2);% ��������ά��
% ���ĵ㷶Χ[lb;ub]
lb=min(X);
ub=max(X);
%% ģ��C��ֵ�������
% ������ָ��Ϊ3������������Ϊ20��Ŀ�꺯������ֹ����Ϊ1e-6
options=[3,20,1e-6];
% �����cn
cn=4;
%% ģ���˻��㷨����
q =0.8;     % ��ȴϵ��
T0=100;    % ��ʼ�¶�
Tend=99.999;  % ��ֹ�¶�
%% �����Ŵ��㷨����
sizepop=10;               %������Ŀ(Numbe of individuals)
MAXGEN=100;                %����Ŵ�����(Maximum number of generations)
NVAR=m*cn;                %������ά��
PRECI=10;                 %�����Ķ�����λ��(Precision of variables)
pc=0.7;
pm=0.01;
trace=zeros(NVAR+1,MAXGEN);
%��������������(Build field descriptor)
FieldD=[rep([PRECI],[1,NVAR]);rep([lb;ub],[1,cn]);rep([1;0;1;1],[1,NVAR])];
Chrom=crtbp(sizepop, NVAR*PRECI); % ������ʼ��Ⱥ
V=bs2rv(Chrom, FieldD);
ObjV=ObjFun(X,cn,V,options); %�����ʼ��Ⱥ�����Ŀ�꺯��ֵ
T=T0;
while T>Tend
    gen=0;                                               %��������
    while gen<MAXGEN                                     %����
        FitnV=ranking(ObjV);                          %������Ӧ��ֵ(Assign fitness values)
        SelCh=select('sus', Chrom, FitnV);         %ѡ��
        SelCh=recombin('xovsp', SelCh,pc);             %����
        SelCh=mut(SelCh,pm);                                %����
        V=bs2rv(SelCh, FieldD);
        newObjV=ObjFun(X,cn,V,options);  %�����Ӵ�Ŀ�꺯��ֵ
        newChrom=SelCh;

        %�Ƿ��滻�ɸ���
        for i=1:sizepop
            if ObjV(i)>newObjV(i)
                ObjV(i)=newObjV(i);
                Chrom(i,:)=newChrom(i,:);
            else
                p=rand;
                if p<=exp((newObjV(i)-ObjV(i))/T)
                    ObjV(i)=newObjV(i);
                    Chrom(i,:)=newChrom(i,:);
                end
            end
        end
        gen=gen+1;                                                 %������������
        [trace(end,gen),index]=min(ObjV);                          %�Ŵ��㷨���ܸ���
        trace(1:NVAR,gen)=V(index,:);
        fprintf(1,'%d ',gen);
    end
    T=T*q;
    fprintf(1,'\n�¶�:%1.3f\n',T);
end
[newObjV,center,U]=ObjFun(X,cn,[trace(1:NVAR,end)]',options);  %������ѳ�ʼ�������ĵ�Ŀ�꺯��ֵ
% �鿴������
Jb=newObjV
U=U{1};
center=center{1};
figure
plot(X(:,1),X(:,2),'o')
hold on
maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2, :) == maxU);
index3 = find(U(3, :) == maxU);
% ��ǰ�������������зֱ��ϲ�ͬ�Ǻ� ���ӼǺŵľ��ǵ�������
line(X(index1,1), X(index1, 2), 'linestyle', 'none','marker', '*', 'color', 'g');
line(X(index2,1), X(index2, 2), 'linestyle', 'none', 'marker', '*', 'color', 'r');
line(X(index3,1), X(index3, 2), 'linestyle', 'none', 'marker', '*', 'color', 'b');
% ������������
plot(center(:,1),center(:,2),'v')
hold off

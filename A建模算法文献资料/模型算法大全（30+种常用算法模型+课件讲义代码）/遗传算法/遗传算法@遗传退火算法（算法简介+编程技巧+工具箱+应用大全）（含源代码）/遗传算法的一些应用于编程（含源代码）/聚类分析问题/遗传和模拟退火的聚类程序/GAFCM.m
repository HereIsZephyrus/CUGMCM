% �Ŵ��㷨�Ľ���ģ��C-��ֵ����MATLABԴ��
function [BESTX,BESTY,ALLX,ALLY]=GAFCM(K,N,Pm,LB,UB,D,c,m)
%% �˺���ʵ���Ŵ��㷨������ģ��C����ֵ����
%% ��������б�
% K        ��������
% N        ��Ⱥ��ģ��Ҫ����ż��
% Pm       �������
% LB       ���߱������½磬M��1������
% UB       ���߱������Ͻ磬M��1������
% D        ԭʼ�������ݣ�n��p�ľ���
% c        �������
% m        ģ��C��ֵ������ѧģ���е�ָ��
%% ��������б�
% BESTX    K��1ϸ���ṹ��ÿһ��Ԫ����M��1��������¼ÿһ�������Ÿ���
% BESTY    K��1���󣬼�¼ÿһ�������Ÿ�������ۺ���ֵ
% ALLX     K��1ϸ���ṹ��ÿһ��Ԫ����M��N���󣬼�¼ȫ������
% ALLY     K��N���󣬼�¼ȫ����������ۺ���ֵ
%% ��һ����
M=length(LB);%���߱����ĸ���
%��Ⱥ��ʼ����ÿһ����һ������
farm=zeros(M,N);
for i=1:M
    x=unifrnd(LB(i),UB(i),1,N);
    farm(i,:)=x;
end
%���������ʼ��
ALLX=cell(K,1);%ϸ���ṹ��ÿһ��Ԫ����M��N���󣬼�¼ÿһ���ĸ���
ALLY=zeros(K,N);%K��N���󣬼�¼ÿһ�����ۺ���ֵ
BESTX=cell(K,1);%ϸ���ṹ��ÿһ��Ԫ����M��1��������¼ÿһ�������Ÿ���
BESTY=zeros(K,1);%K��1���󣬼�¼ÿһ�������Ÿ�������ۺ���ֵ
k=1;%������������ʼ��
%% �ڶ�������������
while k<=K
%% �����ǽ������
    newfarm=zeros(M,2*N);
    Ser=randperm(N);%���������Ե���Ա�
    A=farm(:,Ser(1));
    B=farm(:,Ser(2));
    P0=unidrnd(M-1);
    a=[A(1:P0,:);B((P0+1):end,:)];%�����Ӵ�a
    b=[B(1:P0,:);A((P0+1):end,:)];%�����Ӵ�b
    newfarm(:,2*N-1)=a;%�����Ӵ���Ⱥ
    newfarm(:,2*N)=b;    
    for i=1:(N-1)
        A=farm(:,Ser(i));
        B=farm(:,Ser(i+1));
        P0=unidrnd(M-1);
        a=[A(1:P0,:);B((P0+1):end,:)];
        b=[B(1:P0,:);A((P0+1):end,:)];
        newfarm(:,2*i-1)=a;
        newfarm(:,2*i)=b;
    end    
    FARM=[farm,newfarm];    
%% ѡ����
    SER=randperm(3*N);
    FITNESS=zeros(1,3*N);
    fitness=zeros(1,N);
    for i=1:(3*N)
        Beta=FARM(:,i);
        FITNESS(i)=FIT(Beta,D,c,m);
    end    
    for i=1:N
        f1=FITNESS(SER(3*i-2));
        f2=FITNESS(SER(3*i-1));
        f3=FITNESS(SER(3*i));
        if f1<=f2&&f1<=f3
            farm(:,i)=FARM(:,SER(3*i-2));
            fitness(:,i)=FITNESS(:,SER(3*i-2));
        elseif f2<=f1&&f2<=f3
            farm(:,i)=FARM(:,SER(3*i-1));
            fitness(:,i)=FITNESS(:,SER(3*i-1));
        else
            farm(:,i)=FARM(:,SER(3*i));
            fitness(:,i)=FITNESS(:,SER(3*i));
        end
    end    
    %% ��¼��Ѹ������������
    X=farm;
    Y=fitness;
    ALLX{k}=X;
    ALLY(k,:)=Y;
    minY=min(Y);
    pos=find(Y==minY);
    BESTX{k}=X(:,pos(1));
    BESTY(k)=minY;    
    %% ����
    for i=1:N
        if Pm>rand&&pos(1)~=i
            AA=farm(:,i);
            BB=GaussMutation(AA,LB,UB);
            farm(:,i)=BB;
        end
    end
    disp(k);
    k=k+1;
end
%% ��ͼ
BESTY2=BESTY;
BESTX2=BESTX;
for k=1:K
    TempY=BESTY(1:k);
    minTempY=min(TempY);
    posY=find(TempY==minTempY);
    BESTY2(k)=minTempY;
    BESTX2{k}=BESTX{posY(1)};
end
BESTY=BESTY2;
BESTX=BESTX2;
plot(BESTY,'-ko','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',2)
ylabel('����ֵ')
xlabel('��������')
grid on 


%........�ṩ��/daichenglei/........
%.........������Ϊѡ�����.select operator.........
%******************����������˵��******************
%-------newPopulation��ѡ��������Ⱥ
%-------Distance�������洢���������·������
%-------Sum����·������
%-------Fitness��ÿ���������Ӧ����
%-------sFitness���ۻ�����
%-------a��˦�����
function [newPopulation,R,Rlength,counter2,rr]=select(Population,nPopulation,nCity,dCity,Rlength,R,counter2,pi,nRemain)
Distance=zeros(nPopulation,1);                  %�㻯·������
Fitness=zeros(nPopulation,1);                   %�㻯��Ӧ����
Sum=0;                                          %·������
for i=1:nPopulation                             %�������·������
    for j=1:nCity-2
        Distance(i)=Distance(i)+dCity(Population(i,j),Population(i,j+1)); 
    end                                         %��·�����ȵ�����������ʼ�㵽·����β��ľ���
    Distance(i)=Distance(i)+dCity(Population(i,1),nCity)+dCity(Population(i,nCity-1),nCity);
    Sum=Sum+Distance(i);                        %�ۼ���·������
end                                             %�������·������
if Rlength==min(Distance)
    counter2=counter2+1;
else
    counter2=0;
end
Rlength=min(Distance);                          %�������·������
rr=find(Distance==Rlength);
R=Population(rr(1,1),:);                        %�������·��
for i=1:nPopulation
   Fitness(i)=(max(Distance)-Distance(i)+0.001)/(nPopulation*(max(Distance)+0.001)-Sum);     %��Ӧ����=����/�ܺ�...������������С���˵���
end
%Fitness            %��ʾ��Ӧ����
sFitness=zeros(nPopulation,1);                  %�ۻ�����
sFitness(1)=Fitness(1);
for i=2:nPopulation
    sFitness(i)=sFitness(i-1)+Fitness(i);
end
%sFitness           %��ʾ�ۻ�����
newPopulation=zeros(nPopulation,nCity-1);       %�㻯����Ⱥ
for i=1:nPopulation                             %˦�����
    a=rand;
    %a              %��ʾ˦���������
    for j=1:nPopulation
        if a<sFitness(j)
            newPopulation(i,:)=Population(j,:);
            break
        end
    end
end
for i=1:size(rr,1)
    if rand<pi(1)&i<=nRemain
        newPopulation(rr(i,1),:)=Population(rr(i,1),:);
    end
end
%newPopulation      %��ʾ��ѡ�е�����Ⱥ����

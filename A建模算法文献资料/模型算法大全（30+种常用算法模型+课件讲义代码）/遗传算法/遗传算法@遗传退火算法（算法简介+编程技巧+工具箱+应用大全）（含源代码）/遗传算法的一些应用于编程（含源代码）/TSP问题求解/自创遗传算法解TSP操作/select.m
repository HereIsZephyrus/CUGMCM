%........提供者/daichenglei/........
%.........本函数为选择操作.select operator.........
%******************参数及参数说明******************
%-------newPopulation：选择后的新种群
%-------Distance：用来存储及计算个体路径长度
%-------Sum：总路径长度
%-------Fitness：每个个体的适应概率
%-------sFitness：累积概率
%-------a：甩随机数
function [newPopulation,R,Rlength,counter2,rr]=select(Population,nPopulation,nCity,dCity,Rlength,R,counter2,pi,nRemain)
Distance=zeros(nPopulation,1);                  %零化路径长度
Fitness=zeros(nPopulation,1);                   %零化适应概率
Sum=0;                                          %路径长度
for i=1:nPopulation                             %计算个体路径长度
    for j=1:nCity-2
        Distance(i)=Distance(i)+dCity(Population(i,j),Population(i,j+1)); 
    end                                         %对路径长度调整，增加起始点到路径首尾点的距离
    Distance(i)=Distance(i)+dCity(Population(i,1),nCity)+dCity(Population(i,nCity-1),nCity);
    Sum=Sum+Distance(i);                        %累计总路径长度
end                                             %计算个体路径长度
if Rlength==min(Distance)
    counter2=counter2+1;
else
    counter2=0;
end
Rlength=min(Distance);                          %更新最短路径长度
rr=find(Distance==Rlength);
R=Population(rr(1,1),:);                        %更新最短路径
for i=1:nPopulation
   Fitness(i)=(max(Distance)-Distance(i)+0.001)/(nPopulation*(max(Distance)+0.001)-Sum);     %适应概率=个体/总和...已作调整，大小作了调换
end
%Fitness            %显示适应概率
sFitness=zeros(nPopulation,1);                  %累积概率
sFitness(1)=Fitness(1);
for i=2:nPopulation
    sFitness(i)=sFitness(i-1)+Fitness(i);
end
%sFitness           %显示累积概率
newPopulation=zeros(nPopulation,nCity-1);       %零化新种群
for i=1:nPopulation                             %甩随机数
    a=rand;
    %a              %显示甩出的随机数
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
%newPopulation      %显示被选中的新种群个体

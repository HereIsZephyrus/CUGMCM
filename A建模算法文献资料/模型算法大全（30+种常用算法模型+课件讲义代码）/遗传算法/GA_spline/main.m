%使用三次样条插值的遗传算法
%运行过程中显示的tmpMin表示当前种群中的最低成本
%tmpAvg表示当前种群中的平均成本
%minScore表示目前整个运行中出现过的最低成本
%minScoreMethod表示上述最低成本对应的事前观察点
%g表示当前种群的子代数

clear;

global pop;             %取观察点种群
global fitnessTable;    %成本列表
global voltageX;         %样本电压X列表
global outputY;       %样本物理量Y列表
global len;             %样本组数量

popSize=100;            %种群大小
codeSize=7;             %观察点数量
crossRate=0.9;          %交叉概率
mutateRate=0.05;         %变异概率
maxGeneration=1000;     %最大子代数
aimScore=90;           %目标成本
minScore=200;             %最低成本

rand('state',sum(100*clock));

readData();
init(popSize,codeSize,51);
fitnessTable=zeros(popSize,1);
for i=1:popSize
    fitnessTable(i)=fitness(pop(i,:));
end
tmpMin=min(fitnessTable)

if tmpMin<minScore
    minScore=tmpMin;
    minScoreLocation=find(fitnessTable==tmpMin);
    minScoreMethod=pop(minScoreLocation,:);
end
minScore
minScoreMethod
if minScore<aimScore
    return;
end
g=1;
while g<=maxGeneration
    selection(popSize,codeSize);
    cross(popSize,codeSize,crossRate);
    mutation(popSize,codeSize,mutateRate);
    for i=1:popSize
        fitnessTable(i)=fitness(pop(i,:));
    end
    tmpMin=min(fitnessTable)
   
    if tmpMin<minScore
        minScore=tmpMin;
        minScoreLocation=find(fitnessTable==tmpMin);
        minScoreMethod=pop(minScoreLocation,:);
    end
    minScore
    minScoreMethod
    if minScore<aimScore
        break;
    end
    g
    g=g+1;
end


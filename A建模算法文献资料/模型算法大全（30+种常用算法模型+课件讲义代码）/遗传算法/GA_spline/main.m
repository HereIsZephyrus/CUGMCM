%ʹ������������ֵ���Ŵ��㷨
%���й�������ʾ��tmpMin��ʾ��ǰ��Ⱥ�е���ͳɱ�
%tmpAvg��ʾ��ǰ��Ⱥ�е�ƽ���ɱ�
%minScore��ʾĿǰ���������г��ֹ�����ͳɱ�
%minScoreMethod��ʾ������ͳɱ���Ӧ����ǰ�۲��
%g��ʾ��ǰ��Ⱥ���Ӵ���

clear;

global pop;             %ȡ�۲����Ⱥ
global fitnessTable;    %�ɱ��б�
global voltageX;         %������ѹX�б�
global outputY;       %����������Y�б�
global len;             %����������

popSize=100;            %��Ⱥ��С
codeSize=7;             %�۲������
crossRate=0.9;          %�������
mutateRate=0.05;         %�������
maxGeneration=1000;     %����Ӵ���
aimScore=90;           %Ŀ��ɱ�
minScore=200;             %��ͳɱ�

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


%% �����Ż��㷨��������������ѡַ�е�Ӧ��
%% ��ջ���
clc
clear

%% �㷨��������           
sizepop=50;           % ��Ⱥ��ģ
overbest=10;          % ���������
MAXGEN=100;            % ��������
pcross=0.5;           % �������
pmutation=0.4;        % �������
ps=0.95;              % ���������۲���
length=6;             % ����������
M=sizepop+overbest;

%% step1 ʶ��ԭ,����Ⱥ��Ϣ����Ϊһ���ṹ��
individuals = struct('fitness',zeros(1,M), 'concentration',zeros(1,M),'excellence',zeros(1,M),'chrom',[]);
%% step2 ������ʼ����Ⱥ
individuals.chrom = popinit(M,length);
trace=[]; %��¼ÿ�����������Ӧ�Ⱥ�ƽ����Ӧ��

%% ����Ѱ��
for iii=1:MAXGEN

     %% step3 ����Ⱥ����������
     for i=1:M
         individuals.fitness(i) = fitness(individuals.chrom(i,:));      % �����뿹ԭ�׺Ͷ�(��Ӧ��ֵ������
         individuals.concentration(i) = concentration(i,M,individuals); % ����Ũ�ȼ���
     end
     % �ۺ��׺ͶȺ�Ũ�����ۿ�������̶ȣ��ó���ֳ����
     individuals.excellence = excellence(individuals,M,ps);
          
     % ��¼������Ѹ������Ⱥƽ����Ӧ��
     [best,index] = min(individuals.fitness);   % �ҳ�������Ӧ�� 
     bestchrom = individuals.chrom(index,:);    % �ҳ����Ÿ���
     average = mean(individuals.fitness);       % ����ƽ����Ӧ��
     trace = [trace;best,average];              % ��¼
     
     %% step4 ����excellence���γɸ���Ⱥ�����¼���⣨���뾫Ӣ�������ԣ�����s���ƣ�
     bestindividuals = bestselect(individuals,M,overbest);   % ���¼����
     individuals = bestselect(individuals,M,sizepop);        % �γɸ���Ⱥ

     %% step5 ѡ�񣬽��棬����������ټ��������п��壬��������Ⱥ
     individuals = Select(individuals,sizepop);                                                             % ѡ��
     individuals.chrom = Cross(pcross,individuals.chrom,sizepop,length);                                    % ����
     individuals.chrom = Mutation(pmutation,individuals.chrom,sizepop,length);   % ����
     individuals = incorporate(individuals,sizepop,bestindividuals,overbest);                               % ���������п���      

end

%% ���������㷨��������
figure(1)
plot(trace(:,1));
hold on
plot(trace(:,2),'--');
legend('������Ӧ��ֵ','ƽ����Ӧ��ֵ')
title('�����㷨��������','fontsize',12)
xlabel('��������','fontsize',12)
ylabel('��Ӧ��ֵ','fontsize',12)

%% ������������ѡַͼ
%��������
city_coordinate=[1304,2312;3639,1315;4177,2244;3712,1399;3488,1535;3326,1556;3238,1229;4196,1044;4312,790;4386,570;
                3007,1970;2562,1756;2788,1491;2381,1676;1332,695;3715,1678;3918,2179;4061,2370;3780,2212;3676,2578;
                 4029,2838;4263,2931;3429,1908;3507,2376;3394,2643;3439,3201;2935,3240;3140,3550;2545,2357;2778,2826;2370,2975];
carge=[20,90,90,60,70,70,40,90,90,70,60,40,40,40,20,80,90,70,100,50,50,50,80,70,80,40,40,60,70,50,30];
%�ҳ�������͵�
for i=1:31
    distance(i,:)=dist(city_coordinate(i,:),city_coordinate(bestchrom,:)');
end
%city_coordinate=[1.25,1.25;8.75,0.75;0.5,4.75;5.75,5;3,6.5;7.25,7.75];           
%������
%carge=[3,5,4,7,6,11];

%�ҳ�������͵�
%for i=1:31
   % distance(i,:)=dist(city_coordinate(i,:),city_coordinate(bestchrom,:)');
%end
[a,b]=min(distance');

index=cell(1,length);

for i=1:length
%����������͵�ĵ�ַ
index{i}=find(b==i);
end
figure(2)
title('���Ź滮����·��')
cargox=city_coordinate(bestchrom,1);
cargoy=city_coordinate(bestchrom,2);
plot(cargox,cargoy,'rs','LineWidth',2,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','b',...
    'MarkerSize',20)
hold on

plot(city_coordinate(:,1),city_coordinate(:,2),'o','LineWidth',2,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor','g',...
    'MarkerSize',10)

for i=1:31
    x=[city_coordinate(i,1),city_coordinate(bestchrom(b(i)),1)];
    y=[city_coordinate(i,2),city_coordinate(bestchrom(b(i)),2)];
    plot(x,y,'c');hold on
end


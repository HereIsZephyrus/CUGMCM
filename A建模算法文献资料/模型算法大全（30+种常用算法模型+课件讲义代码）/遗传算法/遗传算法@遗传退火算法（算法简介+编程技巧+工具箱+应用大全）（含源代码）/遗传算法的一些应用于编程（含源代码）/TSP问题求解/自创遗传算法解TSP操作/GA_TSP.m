%----------------------- �Ŵ��㷨���TSP���� -----------------------
%.........<������.Main>.........
%******************����������˵��******************
%-------nCity����������������ȡֵ��Χ��>2 ������
%-------xyCity�����ж�ά���꣬�����ɼ���������������Χ(0,1)���ٶ���ʼ����Ϊ��nCity�����У�
%-------dCity�����м������󣬱������ǳ��м�����������ȣ��Ҷ������Ϊŷ����·�����
%-------nPopulation����Ⱥ����������
%-------Population����Ⱥ��nPopulation*(nCity-1)����ÿ����{1,2,...,nCity-1}ĳһ��ȫ���й��ɣ�
%-------generation���㷨��ֹ����һ������������
%-------nR���㷨��ֹ�����������·��ֵ����nR�����䣻
%-------R�����·����
%-------Rlength�����·�����ȡ�
%-------Shock�������Ÿ��屣��һ��ʱ�ڲ���󣬲�����
function [R,Rlength]=GA_TSP(xyCity,dCity,Population,nPopulation,pCrossover,percent,pMutation,generation,nR,rr,rangeCity,rR,moffspring,record,pi,Shock,maxShock)
%10����������
%xyCity=[0.4 0.4439;0.2439 0.1463;0.1707 0.2293;0.2293 0.761;0.5171 0.9414;
 %  0.8732 0.6536;0.6878 0.5219;0.8488 0.3609;0.6683 0.2536;0.6195 0.2634];
%10 cities d'=2.691
%--------------------------------------------------------------------------
%30����������
xyCity=[25 62;7 64;2 99;68 58;71 44];
xyCity=[41 94;37 84;54 67;25 62;7 64;2 99;68 58;71 44;54 62;83 69;64 60;18 54;22 60;
    83 46;91 38;25 38;24 42;58 69;71 71;74 78;87 76;18 40;13 40;82 7;62 32;58 35;45 21;41 26;44 35;4 50];
%30 cities d'=423.741 by D B Fogel
%--------------------------------------------------------------------------
%50����������
%xyCity=[31 32;32 39;40 30;37 69;27 68;37 52;38 46;31 62;30 48;21 47;25 55;16 57;
%17 63;42 41;17 33;25 32;5 64;8 52;12 42;7 38;5 25; 10 77;45 35;42 57;32 22;
%27 23;56 37;52 41;49 49;58 48;57 58;39 10;46 10;59 15;51 21;48 28;52 33;
%58 27;61 33;62 63;20 26;5 6;13 13;21 10;30 15;36 16;62 42;63 69;52 64;43 67];
%50 cities d'=427.855 by D B Fogel
%--------------------------------------------------------------------------
%75����������
%xyCity=[48 21;52 26;55 50;50 50;41 46;51 42;55 45;38 33;33 34;45 35;40 37;50 30;
%55 34;54 38;26 13;15 5;21 48;29 39;33 44;15 19;16 19;12 17;50 40;22 53;21 36;
%20 30;26 29;40 20;36 26;62 48;67 41;62 35;65 27;62 24;55 20;35 51;30 50;
%45 42;21 45;36 6;6 25;11 28;26 59;30 60;22 22;27 24;30 20;35 16;54 10;50 15;
%44 13;35 60;40 60;40 66;31 76;47 66;50 70;57 72;55 65;2 38;7 43;9 56;15 56;
%10 70;17 64;55 57;62 57;70 64;64 4;59 5;50 4;60 15;66 14;66 8;43 26];
%75cities d'=549.18 by D B Fogel
figure(1)
axis([0 10 0 10])                        
grid on
scatter(xyCity(:,1),xyCity(:,2),'x')
grid on
nCity=size(xyCity,1);
for i=1:nCity                                   %������м���룬�������Ϊŷ����·���
    for j=1:nCity
        dCity(i,j)=((xyCity(i,1)-xyCity(j,1))^2+(xyCity(i,2)-xyCity(j,2))^2)^0.5;
    end
end                                             %������м���룬�������Ϊŷ����·���
xyCity;                                        %��ʾ��������
dCity ;                                         %��ʾ���о������
%��ʼ��Ⱥ
nPopulation=50;%��Ⱥ��������                      
for i=1:nPopulation
    Population(i,:)=randperm(nCity-1);          %�����������
end
%Population                                     %��ʾ��ʼ��Ⱥ
%��ӻ�ͼ��ʾ
pCrossover=0.85;
percent=0.6;
pMutation=0.01;
nRemain=40;
pi(1)=0.7;   %ѡ��������Ÿ��屻��������
pi(2)=0.7;  %����������Ÿ��屻��������
pi(3)=0.6;  %ͻ��������Ÿ��屻��������
maxShock=0.05;  %���ͻ�����
Shock=0;
rr=0;
Rlength=0;
counter1=0;
counter2=0;
R=zeros(1,nCity-1);
 %% ѡ��
[newPopulation,R,Rlength,counter2,rr]=select(Population,nPopulation,nCity,dCity,Rlength,R,counter2,pi,nRemain);
R0=R; 
R0=R;
record(1,:)=R;
rR(1)=Rlength;
Rlength0=Rlength;
figure(2)
subplot(1,3,1)
draw(xyCity,R,nCity)
generation=1000;%����������
nR=50;%���·���������ֲ������
while counter1<generation&counter2<nR
    if counter2<nR*1/5
        Shock=0;
    elseif counter2<nR*2/5
        Shock=maxShock*1/4-pMutation;
    elseif counter2<nR*3/5
        Shock=maxShock*2/4-pMutation;
    elseif counter2<nR*4/5
        Shock=maxShock*3/4-pMutation;
    else
        Shock=maxShock-pMutation;
    end
   counter1;
   length=pathlength(dCity,newPopulation);
   %fprintf('%d   %1.10f\n',i,min(length));
   %line([i-1,i],[prelength,min(length)]);pause(0.0001);
%% �������
   offspring=crossover(newPopulation,nCity,pCrossover,percent,nPopulation,rr,pi,nRemain);  
    %% ����
 moffspring=mutation(offspring,nCity,pMutation,nPopulation,rr,pi,nRemain,Shock); 
    %% ��ת����
 niffspring=Reverse(moffspring,dCity);
     %%���²���
Population=Reins(Population,niffspring,length);
R0=R;
    %% ���µ�������
    counter1=counter1+1;
    rR(counter1+1)=Rlength;
    record(counter1+1,:)=R;
end
%R0
%Rlength0
%R
%Rlength
minR=min(rR)
disp('���·�����ִ���:')
rr=find(rR==minR)
disp('���·��:');
record(rr,:)
mR=record(rr(1,1),:)
disp('��ֹ����һ:')
counter1
disp('��ֹ������:')
counter2
disp('���·������:')
minR
disp('���·������:');
rR(1)
subplot(1,3,2)
draw(xyCity,R,nCity);
subplot(1,3,3)
draw(xyCity,mR,nCity);
figure(3)
i=1:counter1+1;
plot(i,rR(i));
grid on
figure();
drawpath(Population(1,:),xyCity);
title('���·������');









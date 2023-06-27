%........�ṩ��/daichenglei/...........
%.........������Ϊ�������Ӳ���crossover operator.........
%˳�򽻲�(OX)����˵����
%���裺
%--1.�ӵ�һ˫�������ѡһ���Ӵ���
%--2.���Ӵ����Ƶ�һ�����ִ�����Ӧλ�ã�����һ��ԭʼ�����
%--3.ɾȥ�ڶ�˫�����Ӵ����еĳ��У��õ�ԭʼ�����Ҫ���������е�˳��
%--4.�����������˳�򣬴����ҽ���Щ���ж�λ������Ŀ�ȱλ���ϡ�
%******************����������˵��******************
%-------offspring���Ӵ���Ⱥ
%-------pCrossover���������
%-------wCrossover��������
%-------pointCrossover�������
%-------percent���������
function offspring=crossover(newPopulation,nCity,pCrossover,percent,nPopulation,rr,pi,nRemain)
offspring=zeros(nPopulation,nCity-1);          %��ʼ�����
ccc=0;
for i=1:nPopulation
    s=find(rr==i);
    if size(s,1)~=0&rand<pi(2)&ccc<nRemain
        offspring(i,:)=newPopulation(i,:);
        ccc=ccc+1;
    elseif rand<pCrossover                     %�Ľ��������Ƹ��屣�������Ƹ��岻���뽻��
        j=unidrnd(nPopulation);            %ѡ����һ���뽻��ĸ���
        while i==j
            j=unidrnd(nPopulation);            %unidrnd(n)����{1,2,...,n}��������
        end
        wCrossover=floor((nCity-1)*percent);        %ȷ��������
        backPopulation=newPopulation(i,:);         
        pointCrossover=unidrnd(nCity-1-wCrossover); %�����������㣬����ȷ�������
        for m=1:wCrossover                          %OX����
            offspring(i,pointCrossover+m-1)=newPopulation(j,pointCrossover+m-1);      %����1~2
        end
        for n=1:nCity-1
            for m=1:wCrossover
                if backPopulation(n)==newPopulation(j,pointCrossover+m-1)
                    backPopulation(n)=0;
                end
            end
        end
        for n=1:nCity-1
            if backPopulation(n)~=0
                for o=1:nCity-1
                    if offspring(i,o)==0
                        offspring(i,o)=backPopulation(n);
                        break
                    end
                end
            end
        end
    else offspring(i,:)=newPopulation(i,:);
    end
end
%offspring             %��ʾ������Ӵ�

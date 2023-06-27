%........提供者/daichenglei/...........
%.........本函数为交叉算子操作crossover operator.........
%顺序交叉(OX)算子说明：
%步骤：
%--1.从第一双亲中随机选一个子串；
%--2.将子串复制到一个空字串的相应位置，产生一个原始后代；
%--3.删去第二双亲中子串已有的城市，得到原始后代需要的其他城市的顺序；
%--4.按照这个城市顺序，从左到右将这些城市定位到后代的空缺位置上。
%******************参数及参数说明******************
%-------offspring：子代种群
%-------pCrossover：交叉概率
%-------wCrossover：交叉宽度
%-------pointCrossover：交叉点
%-------percent：交叉比例
function offspring=crossover(newPopulation,nCity,pCrossover,percent,nPopulation,rr,pi,nRemain)
offspring=zeros(nPopulation,nCity-1);          %初始化后代
ccc=0;
for i=1:nPopulation
    s=find(rr==i);
    if size(s,1)~=0&rand<pi(2)&ccc<nRemain
        offspring(i,:)=newPopulation(i,:);
        ccc=ccc+1;
    elseif rand<pCrossover                     %改进方向：优势个体保留，劣势个体不参与交叉
        j=unidrnd(nPopulation);            %选择另一参与交叉的个体
        while i==j
            j=unidrnd(nPopulation);            %unidrnd(n)产生{1,2,...,n}里的随机数
        end
        wCrossover=floor((nCity-1)*percent);        %确定交叉宽度
        backPopulation=newPopulation(i,:);         
        pointCrossover=unidrnd(nCity-1-wCrossover); %随机产生交叉点，做差确保不溢出
        for m=1:wCrossover                          %OX交叉
            offspring(i,pointCrossover+m-1)=newPopulation(j,pointCrossover+m-1);      %步骤1~2
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
%offspring             %显示交叉后子代

function [] = selection(popSize,codeSize)
global pop;
global fitnessTable;
fitnessSum=zeros(popSize,1);
fitnessSum(1)=1/fitnessTable(1);
for i=2:popSize
    fitnessSum(i)=fitnessSum(i-1)+1/fitnessTable(i);
end
popNew=zeros(popSize,codeSize);
for i=1:popSize
    r=rand()*fitnessSum(popSize);
    left=1;
    right=popSize;
    mid=round((left+right)/2);
    while 1
        if r>fitnessSum(mid)
            left=mid;
        else
            if r<fitnessSum(mid)
                right=mid;
            else
                popNew(i,:)=pop(mid,:);
                break;
            end
        end
        mid=round((left+right)/2);
        if (mid==left)||(mid==right)
            popNew(i,:)=pop(right,:);
            break;
        end
    end
end
pop=popNew;


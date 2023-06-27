function [] = cross(popSize,codeSize,crossRate)
global pop;
for i=1:2:popSize
    r=rand;
    if r>crossRate
        continue;
    end
    p=randi([2,codeSize]);
    tmp=pop(i,p:codeSize);
    pop(i,p:codeSize)=pop(i+1,p:codeSize);
    pop(i+1,p:codeSize)=tmp;
    checkPop(i,codeSize);
    checkPop(i+1,codeSize);
end
end
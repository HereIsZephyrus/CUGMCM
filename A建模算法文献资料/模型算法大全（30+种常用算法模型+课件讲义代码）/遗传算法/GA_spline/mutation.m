function mutation(popSize,codeSize,mutateRate)
global pop;
for i=1:popSize
    r=rand();
    if r<mutateRate
        r=randi(codeSize);
        if rand()>0.5
            x=1;
        else
            x=-1;
        end
        tmp=pop(i,r)+x;
        if (r==1)
            if (tmp>=1)&&(pop(i,r+1)~=tmp)
                pop(i,r)=tmp;
            end
        elseif (r==codeSize)
            if (tmp<=51)&&(pop(i,r-1)~=tmp)
                pop(i,r)=tmp;
            end
        else
            if (pop(i,r-1)~=tmp)&&(pop(i,r+1)~=tmp)
                pop(i,r)=tmp;
            end
        end
        %checkPop(i,codeSize);
    end
end
end


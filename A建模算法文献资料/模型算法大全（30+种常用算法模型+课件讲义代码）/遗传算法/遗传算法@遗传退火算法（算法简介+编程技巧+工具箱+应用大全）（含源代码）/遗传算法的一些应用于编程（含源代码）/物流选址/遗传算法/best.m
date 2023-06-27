Function
[bestindividual,bestfit,bestrestriction,nopos]=best(chrom,fitvalue,restriction);
[NIND,NVAR]=size(chrom);
pos=l;
for i=l:NIND
   if restriction(pos,l)>restriction(i,l)
      pos=i;
 end
 if(restriction(pos,l)==restriction(i,1))&(fitvalue(pos,l)<fitvalue(i,l))
      pos=i;
   end
end
bestindividual=chrom(pos,:);
bestfit=fitvalue(pos);
bestrestriction=restriction(pos,:);
nopos=l;
for i=l:NIND
   if restriction(nopos,l)<restriction(i,l)
       nopos=i;
   end
   if(restriction(nopos,1)==restriction(i,l))&(fitvalue(nopos,l)>fitvalue(i,l))
       nopos=i;
    end
end

function[newchrom]=selection(chrom,fitvalue)
totalfit=sum(fitvalue);
fitvalue=fitvalue/totalfit;
fitvalue=cumsum(fitvalue);
[NIND,NVAR]=size(chrom);
ms=sort(rand(NIND,l));
fitin=l;newin=l;
	while newin<=NIND
if(ms(newin))<fitValue(fitin)
temp(newin,:)=chrom(fitin,:);
newin=newin+l;
else
fitin=fitin+1;
end
if fitin>=NIND
    fitin=NIND;
end
end
newchrom=temp;

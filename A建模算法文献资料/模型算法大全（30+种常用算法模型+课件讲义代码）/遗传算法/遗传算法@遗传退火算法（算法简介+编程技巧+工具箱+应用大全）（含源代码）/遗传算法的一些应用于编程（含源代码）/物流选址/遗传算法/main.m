global gen;
NIND=200;
MAXGEN=2000;
NVAR=55;
Cmax=5000000;
Pm=0.3;
m=2;
n=5;
l=8;
A=[100 100];
M=[90 105 100 115 115];
D=[10 10 10 15 5 15 10 15];
f=[60000;90000;60000;75000;75000];
v=[50;65;60;55;55];
a=[60;120;70;100;80;90;120;60;110;80];
e=[30;55;25;40;25;50;55;55;65;80;40;45;20;35;20;20;50;55;15;25;5;25;45;25;65;75;
45;30;35;10;50;10;45;35;15;10;30;25;60;40];
P=3;
for i=l:NIND
    while 0<l
         for j=l:5
            chroml(i,j)=round(rand(l));
         end
         if(sum(chroml(i,:),2)>=l)&(sum(chroml(i,:),2)<=P)
            break
         end
     end
end
 sumx=zeros(NIND,5); 
 sumy=zeros(NIND,5);
for i=l:NIND
  for j=l:5
if chrom1(i,j)==0
    chrom2(i,(2*(j-l)+l):(2*j))=0;
    chrom3(i,(8*(j-l)+l):(8*j))=0;
else
    while chrom1(i,j)==1
    chrom2(i,(2*(j-1)+l):(2*j))=rand(1,2).*min(A,[M(j),M(j)]);
    sumx(i,j)=sum(chrom2(i,(2*(j-l)+l):(2*j)),2);
	chrom3(i,(8*(j-1)+l):(8*j))=rand(l,8).*(rep(M(j),[1 l]));
	  sumy(i,j)=sum(chrom3(i,(8*(j-l)+l):(8*j)),2);
      chrom3(i,(8*(j-l)+l):(8*j))=(sumx(i,j)/sumy(i,j))*chrom3(i,(8*(j-l)+l):(8*j));
    if sumx(i,j)<=1.0*M(j)
       break
        end
      end
    end
  end
end
Chrom=[chrom1 chrom2 chrom3];
[objvalue]=calobjvalue(chrom,m,n,l,a,c,v,f);
[fitvalue,restriction]=calfitvalue(objvalue,chrom,Cmax,m,n,l,A,M,D,P);
[bestindividual,bestfit,bestrestriction,nopos]=best(chrom,fitvalue,restrietion);
gen= 0;
while gen<MAXGEN
   [objvalue]=calobjvalue(chrom,m,n,l,a,c,v,f);
[fitvalue,restriction]=calfitvalue(objvaluechrom,Cmax,m,n,1,A,M,D,P);
[bestindividual1,bestfit1,bestrestriction1,nopos1]=best(chrom,fitvalue,restriction);
    if bestrestrction>bestrestriction1
      bestindividual=bestindividual1;
      bestfit=bestfit1;
      bestrestriction=bestrestriction1;
end
if(bestrestriction==bestrestriction1)&&(bestfit<bestfit1)
   bestindividual=bestindividual1;
   bestfit=bestfit1;
   bestrestriction=bestrestriction1;
end
chrom(nopos1,:)=bestindividual;
[newchrom]=selection(chrom,fitvalue);
[newchrom]=crossover(newchrom,m,n,l);
[newchrom]=mutation(newchrom,Pm,m,n,l);
[bestindividual2,bestfit2,bestrestriction2,nopos2]=best(newchrom,fitvalue,restriction);
if bestrestriction>bestrestriction2
    bestindividual=bestindividual2;
    bestfit=bestfit2;
    bestrestriction=bestrestriction2;
end
if(bestrestriction==bestrestriction2)&&(bestfit<bestfit2)
   bestindividual=bestindividual2;
   bestfit=bestfit2;
   bestrestriction=bestrestriction2;
end
chrom=newchrom;
gen=gen+l;
end
   bestindividual;bestfit;bestrestriction;
  
function[newchrom]=mutation(chrom,Pm,m,n,l)
global gen;
FieldDR=[0 0 0 0 0 0 0 0 0 0;90 90 105 105 100 100 115 115 115 115];
RANGE=[0 0 0 0 0 0 0 0;10 10 10 15 5 15 10 15];
[NIND,NVAR]=size(chrom);
chrom1=chrom(:,l:n);
chrom2=chrom(:,(n+l):(n+m*n));
chrom3=chrom(:,(n+m*n+1):(n+m*n+n*l));
newchrom=zeros(NIND,NVAR);
newchrom1=zeros(NIND,n);
newchrom2=zeros(NIND,m*n);
newchrom3=zeros(NIND,n*l);
for i=l:NIND
    for j=l:n
        if chrom1(i,j)==0
            newchrom2(i,(m*(j-l)+l):(m*j))=0;
            newchrom3(i,(l*(j-l)+l):(l*j))=0;
    else
       if round(rand)==0
       newchrom2(i,(m*(j-l)+l):(m*j))=chrom2(i,(m*(j-l)+l):(m*j))+...
(FieldDR(2,(m*(j-l)+l):(m*j))-chrom2(i,(m*(j-l)+l):(m*j)))*(l-rand^((l-gen/2000)^10));
       newchrom3(i,(l*(j-l)+l):(l*j))=chrom3(i,(l*(j-l)+l):(l*j))+...
([10 10 10 15 5 15 10 15]-chrom3(i,(l*(j-l)+1):(l*j)))*(l-rand^((1-gen/2000)^10));
        elseif round(rand)==1
        newchrom2(i,(m*(j-l)+l):(m*j))=chrom2(i,(m*(j-l)+1):(m*j))-...
(chrom2(i,(m*(j-l)+l):(m*j))-[0 0])*(1-rand^((l-gen/2000)^10));
        newchrom3(i,(l*(j-l)+l):(l*j))=chrom3(i,(l*(j-1)+l):(l*j))-...
(chrom3(i,(1*(j-1)+l):(l*j))-[0 0 0 0 0 0 0 0]*(l-rand^((l-gen/2000)^10)));
        end
     end
   end
end
 newchrom1=chrom1;
 newchrom=[newchrom1 newchrom2 newchrom3];
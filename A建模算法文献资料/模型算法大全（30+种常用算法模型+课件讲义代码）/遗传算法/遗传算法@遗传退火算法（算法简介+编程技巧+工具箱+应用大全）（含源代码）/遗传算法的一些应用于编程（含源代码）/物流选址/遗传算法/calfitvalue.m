function[fitvalue restriction]=calfitvalue(objvalue,chrom,Cmax,m,n,l,A,M,D,P)
global gen;
[NIND,NVAR]=size(chrom);
chrom1=chrom(:,1:n);
chrom2=chrom(:,(n+l):(n+m*n));
chrom3=chrom(:,(n+m*n+1):(n+m*n+n*l));
restriction=zeros(NIND,1);
r=zeros(NIND,m);
s=zeros(NIND,n);
t=zeros(NIND,1);
u=zeros(NIND,2);
p=zeros(NIND,n);
for i=l:NIND
   for i=l:m
      r(i,j)=A(j)-sum((chrom2(i,j:m:m*n)),2);
      if r(i,j)<0
      restriction(i,l)=restriction(i,l)+1;
    end
end
for j=1:l
    t(i,j)=sum((chrom3(i,j:l:n*l)),2)-D(j);
    if t(i,j)<0
      restriction(i,l)=restriction(i,l)+1;
     end
end
for j=l:n
 s(i,j)=chrom1(i,j)*M(j)-sum(chrom2(i,(m*(j-1)+2):(m*j),2));
 p(i,j)=abs(sum(chrom3(i,(l*(j-1)+1):(l*j)),2)-sum(chrom2(i,(m*(j-1)+l):(m*j)),2));
       if s(i,j)<0
         restriction(i,1)=restriotion(i,l)+l;
       end
       if p(i,j)>=1e-3
         restriction(i,l)=restriction(i,l)+l;
       end
end
  u(i,l)=P-sum(chrom1(i,:),2);
     if u(i,1)<0
         restriction(i,l)=restriction(i,l)+l;
end
 u(i,2)=sum(chrom1(i,:),2)-l;
     if u(i,2)<0
         restriction(i,l)=restriction(i,l)+l;
     end
if(objvalue(i,1)<Cmax)
  fitvalue(i,l)=Cmax-objvalue(i,l);
else
fitvalue(i,l)=0.0;
     end
end

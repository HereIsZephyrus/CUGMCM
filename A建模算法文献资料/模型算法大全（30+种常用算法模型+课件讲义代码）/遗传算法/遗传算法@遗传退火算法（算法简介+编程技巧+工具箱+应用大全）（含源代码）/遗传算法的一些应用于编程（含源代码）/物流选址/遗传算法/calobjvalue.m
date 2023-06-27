 function[objvalue]=calobjvalue(chrom,m,n,l,a,c,v,f)
chrom1=chrom(:,1:n);
chrom2=chrom(:,(n+l):(n+m*n));
chrom3=chrom(:,(n+m*n+1):(n+m*n+n*l));
[NIND,NVAR]=size(chrom);
for i=l:NIND
   for j=l:n
      u(i,j)=120*sum(chrom2(i,(2*(j-1)+l):(2*j)),2);
   end
end
objvalue=chrom2*a*120+chrom3*c*260+sqrt(u).*chrom1*v+chrom1*f;

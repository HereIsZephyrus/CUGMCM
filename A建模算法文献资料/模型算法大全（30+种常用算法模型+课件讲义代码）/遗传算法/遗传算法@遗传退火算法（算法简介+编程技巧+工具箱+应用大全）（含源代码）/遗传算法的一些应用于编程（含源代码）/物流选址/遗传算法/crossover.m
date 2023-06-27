function[newchrom]=crossover(chrom,m,n,l)
global gen;
[NIND,NVAR]=size(chrom);
chrom1=chrom(:,1:n);
chrom2=chrom(:,(n+l):(n+m*n));
chrom3=chrom(:,(n+m*n+l):(n+m*n+n*l));
newchrom=zeros(NIND,NVAR);
Pc=0.75;
for i =l:2:NIND-l
    if(rand<Pc)
        point=ceil(rand*(n-l));
        if point<5
    newchrom(i,:)=[chrom1(i,l:point) chroml(i+l,point+l:n)...
chrom2(i,l:m*point)  chrom2(i+l,m*point+l:m*n)...
chrom3(i,1:l*point) chrom3(i+l,l*point+l:n*l)];
newehrom(i+l,:)=[chrom1(i+l,l:point) chrom1(i,point+l:n)...
chrom2(i+l,l:m*point)  chrom2(i,m*point+1:m*n)...
chrom3(i+l,l:l*point)  chrom3(i,l*point+l:n*l)];
        else
          newchrom(i,:)=chrom(i,:);
        newchrom(i+1,:)=chrom(i+l,:);
        end
    else
        newchrom(i,:)=chrom(i,:);
        newchrom(i+l,:)=chrom(i+l,:);
    end
end

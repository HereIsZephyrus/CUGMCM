s=[];k=0;
for i=0:3
    for j=0:3
       if i>=j & 3-i>=3-j & ~(i==0 & j==0)
           k=k+1;
           s(k,:)=[i,j];
       end
       if i==0 
            k=k+1;
           s(k,:)=[i,j];
       end
        if i==3 & j~=3
            k=k+1;
           s(k,:)=[i,j];
       end
    end
end
s

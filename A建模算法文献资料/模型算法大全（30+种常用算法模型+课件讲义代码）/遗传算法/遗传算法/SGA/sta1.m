S=[];m=0;
for i=0:1
    for j=0:1
        for k=0:1
            for l=0:1
                if (i==1 & (1-j)*(1-k)~=1 & (1-k)*(1-l)~=1) | (i==0 & j*k~=1 & k*l~=1) 
                    m=m+1;
                    S(m,:)=[i j k l]
                end
            end
        end
    end
end
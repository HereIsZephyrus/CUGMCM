S=[];k=0;
for i=0:2
    for j=0:2
        if i+j<=2 & i+j~=0
            k=k+1;
            S(k,:)=[i,j];
        end
    end
end
S

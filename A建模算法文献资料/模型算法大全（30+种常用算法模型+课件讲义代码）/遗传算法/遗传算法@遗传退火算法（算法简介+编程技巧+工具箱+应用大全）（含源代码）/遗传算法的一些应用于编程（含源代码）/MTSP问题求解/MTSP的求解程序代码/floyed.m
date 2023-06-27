function  matrix=floyed(G)
%存储无向图的邻接矩阵 
%{
G=[ inf inf 10 inf 30 100;
    inf inf 5  inf inf inf;
    inf 5 inf 50 inf inf;
    inf inf inf inf inf 10;
    inf inf inf 20 inf 60;
    inf inf inf inf inf inf;];
%}
d(1,:,:)=G;
%处理第一行与第一列 对应相加时，可以优化的距离
for i=1:size(G,1)
    for j=1:size(G,2)
        s(i,j).trace=i;
        if d(1,i,j)<=d(1,i,1)+d(1,1,j)
           d(1,i,j)=d(1,i,j);
        else
           d(1,i,j)=d(1,i,1)+d(1,1,j);
        end
    end
end
%处理从第二 到 顶点个数 个时的 路径优化
for k=2:size(G,1)
    for i=1:size(G,1)
        for j=1:size(G,1)
            if d(k-1,i,j)<=d(k-1,i,k)+d(k-1,k,j)
                d(k,i,j)=d(k-1,i,j);
            else
                d(k,i,j)=d(k-1,i,k)+d(k-1,k,j);
            end
        end
    end
end
matrix=zeros(size(G,1),size(G,1));
matrix=d(size(G,1),:,:);
matrix=reshape(matrix,size(G,1),size(G,1));
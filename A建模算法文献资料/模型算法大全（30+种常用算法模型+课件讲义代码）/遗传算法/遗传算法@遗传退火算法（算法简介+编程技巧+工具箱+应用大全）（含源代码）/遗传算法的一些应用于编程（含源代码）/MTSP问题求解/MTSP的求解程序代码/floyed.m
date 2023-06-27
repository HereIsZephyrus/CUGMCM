function  matrix=floyed(G)
%�洢����ͼ���ڽӾ��� 
%{
G=[ inf inf 10 inf 30 100;
    inf inf 5  inf inf inf;
    inf 5 inf 50 inf inf;
    inf inf inf inf inf 10;
    inf inf inf 20 inf 60;
    inf inf inf inf inf inf;];
%}
d(1,:,:)=G;
%�����һ�����һ�� ��Ӧ���ʱ�������Ż��ľ���
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
%����ӵڶ� �� ������� ��ʱ�� ·���Ż�
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
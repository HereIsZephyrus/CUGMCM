load gj.txt   %��ԭʼ���ݱ����ڴ��ı��ļ� gj.txt�� 
r=corrcoef(gj)  %�������ϵ������ 
d=1-r;  %�������ݱ任,�����ϵ��ת��Ϊ���� 
d=tril(d);       %ȡ������ d ��������Ԫ�� 
d=nonzeros(d);  %ȡ������Ԫ�� 
d=d'; %���������� 
z=linkage(d,'average');  %����ƽ�������� 
dendrogram(z);  %������ͼ 
T=cluster(z,'maxclust',6)  %�ѱ������ֳ� 6 �� 
for i=1:6 
    tm=find(T==i);  %��� i ��Ķ��� 
    tm=reshape(tm,1,length(tm)); %��������� 
    fprintf('��%d �����%s\n',i,int2str(tm)); %��ʾ������ 
end 
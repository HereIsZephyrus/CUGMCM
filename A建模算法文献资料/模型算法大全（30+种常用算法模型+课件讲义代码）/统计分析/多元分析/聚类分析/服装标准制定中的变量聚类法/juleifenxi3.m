%�����������ϵ������ճ�������ı��ļ�ch.txt�� 
clc,clear 
a=textread('ch.txt');     
d=1-abs(a); %�������ݱ任,�����ϵ��ת��Ϊ���� 
d=tril(d);  %���d����������ǲ��� 
b=nonzeros(d);%ȥ��d�е���Ԫ�� 
b=b';  %���������� 
z=linkage(b,'complete'); %������뷨����   
y=cluster(z,'maxclust',2)   %�ѱ������ֳ����� 
ind1=find(y==1);ind1=ind1'  %��ʾ��һ���Ӧ�ı������ 
ind2=find(y==2);ind2=ind2'  %��ʾ�ڶ����Ӧ�ı������ 
dendrogram(z); %������ͼ 
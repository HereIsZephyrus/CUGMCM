clc,clear 
load sn.txt  %��ԭʼ��x1,x2,x3,x4,y�����ݱ����ڴ��ı��ļ�sn.txt�� 
[m,n]=size(sn); 
x0=sn(:,1:n-1);y0=sn(:,n);  
r=corrcoef(x0)  %�������ϵ������ 
xb=zscore(x0);  %����ƾ�����б�׼������ 
yb=zscore(y0);  %��y0���б�׼������ 
%��������������ƾ���������ɷַ���������ֵc����������Ӧ�����ɷֵ�ϵ�� 
%����ֵs��Ӧ��ʽ��26���е�Z����t���ص�������ֵ 
[c,s,t]=princomp(xb) 
contr=cumsum(t)/sum(t)  %�����ۻ������ʣ���i��������ʾǰi�����ɷֵĹ����� 
num=input('��ѡ�����ɷֵĸ���:')   %ͨ���ۻ������ʽ���ʽѡ�����ɷֵĸ��� 
hg1=[ones(m,1),x0]\y0;   %������ͨ��С���˷��ع�ϵ�� 
hg1=hg1' 
%������ʾ��ͨ��С���˷��ع��� 
fprintf('y=%f',hg1(1)); 
for i=1:n-1 
    fprintf('+%f*x%d',hg1(i+1),i); 
end 
fprintf('\n') 
hg=s(:,1:num)\yb;  %���ɷֱ����Ļع�ϵ�� 
hg=c(:,1:num)*hg;  %��׼�������Ļع鷽��ϵ�� 
%�������ԭʼ�����ع鷽�̵�ϵ�� 
hg2=[mean(y0)-std(y0)*mean(x0)./std(x0)*hg, std(y0)*hg'./std(x0)]  
%������ʾ���ɷֻع��� 
fprintf('y=%f',hg2(1)); 
for i=1:n-1 
    fprintf('+%f*x%d',hg2(i+1),i); 
    end 
fprintf('\n') 
%����������ֻع������ʣ���׼�� 
rmse1=sqrt(sum((x0*hg1(2:end)'+hg1(1)-y0).^2)/(m-n)) 
rmse2=sqrt(sum((x0*hg2(2:end)'+hg2(1)-y0).^2)/(m-num-1)) 
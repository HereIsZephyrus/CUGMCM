clc,clear 
x0=[ 1       8.55      470      300       10 
 2       3.79      285      80        10 
 3       4.82      470      300       120 
 4       0.02      470      80        120 
 5       2.75      470      80        10 
 6       14.39     100      190       10 
 7       2.54      100      80        65 
 8       4.35      470      190       65 
 9       13.00     100      300       54 
 10      8.50      100      300       120 
 11      0.05      100      80        120 
 12      11.32     285      300       10 
 13      3.13      285      190       120]; 
x=x0(:,3:5); 
y=x0(:,2); 
beta=[0.1,0.05,0.02,1,2]';  %�ع�ϵ���ĳ�ֵ,��������ȡ�������Ǹ����� 
[betahat,r,j]=nlinfit(x,y,@huaxue,beta);  %r,j�����������õ���Ϣ 
betaci=nlparci(betahat,r,'jacobian',j); 
betaa=[betahat,betaci]   %�ع�ϵ�������������� 
[yhat,delta]=nlpredci(@huaxue,x,betahat,r,'jacobian',j)  
%y��Ԥ��ֵ������������İ뾶����������Ϊyhat��delta�� 
nlintool(x,y,'huaxue',beta) 
function [sol, eval] =gaDemo1Eeval(sol,options)
x=sol(1);
eval = x + 10*sin(5*x)+7*cos(4*x);

%����˵��
%eval���������Ӧ�ȣ� 
%sol����ǰ���壬n+1��Ԫ�ص���������


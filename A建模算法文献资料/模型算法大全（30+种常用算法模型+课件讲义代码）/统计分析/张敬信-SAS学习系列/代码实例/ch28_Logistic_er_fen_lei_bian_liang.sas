* �����Ϊ���������������coronary��caΪ�������������sex��ecgΪ�������Ա��������еĶ������������0��1�������𣬹��ɣ�0��1������; 
data coronary;  
input sex ecg ca count @@;  
datalines;  
0 0 0 11 0 0 1 4  
0 1 0 10 0 1 1 8  
1 0 0 9 1 0 1 9  
1 1 0 6 1 1 1 21  
;  
*scaleѡ�����ڶԹ�����ɢ����У���� descending,�����ca����������sas�а�y=1�ĸ��ʽ�ģ����ordered valueΪ1��Ӧy��ȡֵ  
output�������������,����������predict�����У�Ԥ��ֵΪprob;  
proc logistic data=coronary descending;  
freq count;  
model ca = sex ecg / scale=none aggregate;  
output out=predict pred=prob;  
run;  
proc print data=predict;
run;  
*ods select:���ǽ���Ӱ��Ĳ������ư���;  
ods select FitStatistics ParameterEstimates;  
proc logistic descending;  
freq count;  
model ca=sex ecg sex*ecg;  
run; 

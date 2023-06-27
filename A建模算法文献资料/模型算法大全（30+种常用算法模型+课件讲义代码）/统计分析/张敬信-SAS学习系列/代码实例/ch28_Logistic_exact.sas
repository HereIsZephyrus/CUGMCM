data liver;  
input time $ group $ status $ count @@;  
datalines;  
early antidote severe 6 early antidote not 12  
early control severe 6 early control not 2  
delayed antidote severe 3 delayed antidote not 4  
delayed control severe 3 delayed control not 0  
late antidote severe 5 late antidote not 1  
late control severe 6 late control not 0  
;  
*estimate=both,��ʾ�Ե�һ��exact�����ָ���ı������о�ȷ�����  
joint,��ʾ�Եڶ���exact��time��group�������ϼ���;  
proc logistic descending;  
freq count;  
class time(ref='early') group(ref='control') / param=ref;  
model status = time group / scale=none aggregate clparm=wald;  
exact 'Model 1' intercept time group / estimate=both;  
exact 'Joint Test' time group / joint;  
run;  

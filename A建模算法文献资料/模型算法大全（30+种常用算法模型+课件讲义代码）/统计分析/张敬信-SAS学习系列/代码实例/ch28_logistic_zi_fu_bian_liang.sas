*sentence�Ƕ������������type��priorΪ�������ַ����Ա���;  
data sentence;  
input type $ prior $ sentence $ count @@;  
datalines;  
nrb some y 42    nrb some n 109  
nrb none y 17    nrb none n 75  
other some y 33  other some n 175  
other none y 53  other none n 359  
;  
*class���Է����������0-1����ref= :���ò���ˮƽ������ref=first��ʾsome��Ϊ����ˮƽ  
scale:ָ����ɢ�������㷽����У����ɢ�����������ƫ��� Pearson ����Ŷ�ͳ������   
aggregate:����Ƥ��ѷ��������ͳ����;  
proc logistic data=sentence descending;  
class type prior(ref=first) / param=ref;  
freq count;  
model sentence = type prior / scale=none aggregate;  
run;  
*����ŶȰ���;  
ods select GoodnessOfFit;  
proc logistic descending;  
class type prior (ref=first) / param=ref;  
freq count;  
model sentence = type / scale=none aggregate=(type prior);  
run;  
*��sas����а������ˮƽ������Ŷȡ��������ơ���Ȼ�����,������ʾ;  
ods select ClassLevelInfo GoodnessOfFit ParameterEstimates OddsRatios;  
proc logistic data=sentence descending;  
class type prior(ref='none');  
freq count;  
model sentence = type prior / scale=none aggregate;  
run;  

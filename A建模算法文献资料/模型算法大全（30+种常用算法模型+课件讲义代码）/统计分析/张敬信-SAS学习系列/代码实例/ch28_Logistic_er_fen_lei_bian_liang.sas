* 因变量为二分类变量，数据coronary中ca为二分类因变量，sex、ecg为二分类自变量，所有的二分类变量，用0、1进行区别，构成（0，1）矩阵; 
data coronary;  
input sex ecg ca count @@;  
datalines;  
0 0 0 11 0 0 1 4  
0 1 0 10 0 1 1 8  
1 0 0 9 1 0 1 9  
1 1 0 6 1 1 1 21  
;  
*scale选项用于对过度离散数据校正； descending,因变量ca按降序排序，sas中按y=1的概率建模，即ordered value为1对应y的取值  
output语句设置输出结果,这里结果存在predict数据中，预测值为prob;  
proc logistic data=coronary descending;  
freq count;  
model ca = sex ecg / scale=none aggregate;  
output out=predict pred=prob;  
run;  
proc print data=predict;
run;  
*ods select:考虑交叉影响的参数估计剥离;  
ods select FitStatistics ParameterEstimates;  
proc logistic descending;  
freq count;  
model ca=sex ecg sex*ecg;  
run; 

data uti;  
input diagnosis : $13. treatment $ response $ count @@;  
datalines;  
complicated A cured 78 complicated A not 28  
complicated B cured 101 complicated B not 11  
complicated C cured 68 complicated C not 46  
uncomplicated A cured 40 uncomplicated A not 5  
uncomplicated B cured 54 uncomplicated B not 5  
uncomplicated C cured 34 uncomplicated C not 6  
;  
run;  
ods select FitStatistics;  
proc logistic data = uti;  
freq count;  
class diagnosis treatment /param=ref;  
model response = diagnosis|treatment;  
run;  
ods select FitStatistics GoodnessOfFit TypeIII OddsRatios;  
proc logistic data = uti;  
freq count;  
class diagnosis treatment;  
model response = diagnosis treatment /  
scale=none aggregate;  
run;  
*clodds：计算似然比的置信区间 clparm: 计算参数的置信区间;  
ods select ClparmPL CloddsPL;  
proc logistic data = uti;  
freq count;  
class diagnosis treatment;  
model response = diagnosis treatment / scale=none aggregate clodds=pl clparm=pl;  
run;  
*contrast:定制假设检验的方式，变量需要是矩阵形式;  
ods select ContrastTest ContrastEstimate;  
proc logistic data = uti;  
freq count;  
class diagnosis treatment /param=ref;  
model response = diagnosis treatment;  
contrast 'B versus A' treatment -1 1 / estimate=exp;  
contrast 'A' treatment 1 0;  
contrast 'joint test' treatment 1 0, treatment 0 1;  
run; 

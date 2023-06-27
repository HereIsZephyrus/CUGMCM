*sentence是二分类因变量，type、prior为二分类字符型自变量;  
data sentence;  
input type $ prior $ sentence $ count @@;  
datalines;  
nrb some y 42    nrb some n 109  
nrb none y 17    nrb none n 75  
other some y 33  other some n 175  
other none y 53  other none n 359  
;  
*class：对分类变量进行0-1处理，ref= :设置参照水平，这里ref=first表示some作为参照水平  
scale:指定离散参数估算方法，校正离散情况，给出“偏差和 Pearson 拟合优度统计量”   
aggregate:设置皮尔逊卡方检验统计量;  
proc logistic data=sentence descending;  
class type prior(ref=first) / param=ref;  
freq count;  
model sentence = type prior / scale=none aggregate;  
run;  
*拟合优度剥离;  
ods select GoodnessOfFit;  
proc logistic descending;  
class type prior (ref=first) / param=ref;  
freq count;  
model sentence = type / scale=none aggregate=(type prior);  
run;  
*从sas结果中剥离分类水平、拟合优度、参数估计、似然比情况,单独显示;  
ods select ClassLevelInfo GoodnessOfFit ParameterEstimates OddsRatios;  
proc logistic data=sentence descending;  
class type prior(ref='none');  
freq count;  
model sentence = type prior / scale=none aggregate;  
run;  

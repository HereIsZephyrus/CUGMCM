data effects2;
input sex degree effect count @@;
cards;
0 0 1 21  0 0 0 6  0 1 1 9  0 1 0 9
1 0 1 8   1 0 0 10 1 1 1 4  1 1 0 11
;
run;
proc logistic data = effects2 DESCENDING;
freq count;
model effect = sex degree / scale=none aggregate;  *模型的拟合优度检验;
output out=predict pred=prob; *output语句设置输出结果,这里结果存在predict数据中，预测值为prob; 
run;
proc print data=predict;
run;
*考虑两个自变量的交互作用;
proc logistic data = effects2 DESCENDING;
freq count;
model effect = sex degree sex*degree;
run;

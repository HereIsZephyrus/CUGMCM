data exam25_2;
input x1 y @@; 
x2=x1*x1; 
datalines;  
1 3833.43 
7 3476.76 
2 3811.58 
8 3466.22 
3 3769.47 
9 3395.42 
4 3565.74 
10 3807.08 
5 3481.99 
11 3817.03 
6 3372.82 
12 3884.52 
;  
run;
proc sgplot data = exam25_2; 
scatter x = x1 y = y;
title '原始数据散点图';
run; 
proc reg data = exam25_2; 
model y=x1 x2; 
run; 






  

proc reg;model y=x1 x2 x3/ss1 ss2; run; 






  






proc reg;model y=x1-x5/selection=backward sls=0.05; run; 






proc glm; model y=x1 x1*x1; 

run; 

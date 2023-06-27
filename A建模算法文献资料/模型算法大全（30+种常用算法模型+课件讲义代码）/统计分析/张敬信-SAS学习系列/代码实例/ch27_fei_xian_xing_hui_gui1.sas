data exam25_1;
input x y;
cards;
1.1  109.95
1.2  40.45
1.3  20.09
1.4  24.53
1.5  11.02
1.6  7.39
1.7  4.95
1.8  2.72
1.9  1.82
2  1.49
2.1  0.82
2.2  0.3
2.3  0.2
2.4  0.22
;
run;
proc sgplot data = exam25_1;
scatter x = x  y = y;
run;
proc corr data = exam25_1;
var x y;
run;
data new1;
set exam25_1;
v = log(y);
run;
proc sgplot data = new1;
scatter x = x  y = v;
title '变量代换后数据';
run;
proc reg data = new1; 
var x v;
model v = x; 
print cli; 
title '残差图';
plot residual. * predicted.;
run; 
data new2; 
set exam25_1;
y1 = 14530.28*exp(-4.73895*x); 
run; 
proc gplot data = new2; 
plot y*x=1 y1*x=2 /overlay; 
symbol v=dot i=none cv=red; 
symbol2 i=sm color=blue;
title '指数回归图';
run;

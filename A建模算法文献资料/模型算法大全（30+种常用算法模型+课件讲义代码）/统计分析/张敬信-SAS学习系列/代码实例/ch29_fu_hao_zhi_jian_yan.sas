data time;
input m1 m2 @@;
d= m1-m2;
datalines;
10.2 9.5 9.6  9.8 9.2  8.8
10.6 10.1 9.9  10.3 10.2 9.3
10.6 10.5 10.0 10.0 11.2 10.6
10.7 10.2 10.6 9.8
;
run;
proc print data = time;
title '原始数据';
run;
proc univariate data = time normal;
var d;
run;

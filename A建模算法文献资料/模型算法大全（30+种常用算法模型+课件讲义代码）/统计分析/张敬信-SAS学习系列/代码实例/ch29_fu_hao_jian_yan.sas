data training;
input before after @@;
d= after-before;
datalines;
3  5 2  4 4  3 1  3 4  4
3  5 1  2 4  5 3  1 1  3
3  5 2  4 3  2 3  5 1  3
;
run;
proc print data = training;
title 'ԭʼ����';
run;
proc univariate data = training;
var d;
run;

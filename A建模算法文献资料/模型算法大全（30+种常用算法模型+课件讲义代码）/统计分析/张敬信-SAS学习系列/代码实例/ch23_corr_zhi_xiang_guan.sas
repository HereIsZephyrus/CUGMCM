data persons;
input abilities performance;
performance=400-performance;
datalines;
2  400
4  360
7  300
1  295
6  280
3  350
10 200
9  260
8  220
5  385
;
proc corr data=persons spearman;
var abilities;
with performance;
title 'Correlations for Performance';
title2 'With Abilitiess of Employment';
run;

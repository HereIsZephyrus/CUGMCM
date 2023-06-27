goptions vsize=7cm;
data a;
input overshort@@;
day=_n_;
cards;
78	-58	53	-63	13	-6	-16	-14
3	-74	89	-48	-14	32	56	-86
-66	50	26	59	-47	-83	2	-1
124	-106	113	-76	-47	-32	39	-30
6	-73	18	2	-24	23	-38	91
-56	-58	1	14	-4	77	-127	97
10	-28	-17	23	-2	48	-131	65
-17							
;
proc gplot;
plot overshort*day;
symbol v=diamond i=join c=red;
proc arima data=a;
identify var=overshort;
estimate q=1;
run;

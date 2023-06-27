goptions vsize=7cm hsize=10cm;
data a;
input x@@;
dif1_4=dif4(dif(x));
time=intnx('quarter','1jan1962'd,_n_-1);
format time year4.;
cards;
1.1	0.5	0.4	0.7	1.6	0.6	0.5	0.7
1.3	0.6	0.5	0.7	1.2	0.5	0.4	0.6
0.9	0.5	0.5	1.1	2.9	2.1	1.7	2
2.7	1.3	0.9	1	1.6	0.6	0.5	0.7
1.1	0.5	0.5	0.6	1.2	0.7	0.7	1
1.5	1	0.9	1.1	1.5	1	1	1.6
2.6	2.1	2.3	3.6	5	4.5	4.5	4.9
5.7	4.3	4	4.4	5.2	4.3	4.2	4.5
5.2	4.1	3.9	4.1	4.8	3.5	3.4	3.5
4.2	3.4	3.6	4.3	5.5	4.8	5.4	6.5
8	7	7.4	8.5	10.1	8.9	8.8	9
10	8.7	8.8	8.9	10.4	8.9	8.9	9
10.2	8.6	8.4	8.4	9.9	8.5	8.6	8.7
9.8	8.6	8.4	8.2	8.8	7.6	7.5	7.6
8.1	7.1	6.9	6.6	6.8	6	6.2	6.2
;
proc gplot;
plot x*time dif1_4*time;
symbol c=black i=join v=star;
proc arima;
identify var=x(1,4);
estimate p=2 noint;
forecast lead=0 id=time out=out;
proc gplot data=out;
plot x*time=1 forecast*time=2 /overlay;
symbol1 c=black i=none v=star;
symbol2 c=red i=join v=none;
run;

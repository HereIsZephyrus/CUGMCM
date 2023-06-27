goptions vsize=10cm hsize=10cm;
data a;
input  sha@@;
year=intnx('year','1jan1964'd,_n_-1);
format year year4.;
dif=dif(sha);
cards;
97 130 156.5 135.2 137.7 180.5 205.2 190 188.6 196.7
180.3 210.8 196 223 238.2 263.5 292.6 317 335.4 327
321.9 353.5 397.8 436.8 465.7 476.7 462.6 460.8
501.8 501.5 489.5 542.3 512.2 559.8 542 567
;
run;
proc gplot;
plot sha*year=1 dif*year=2;
symbol1 v=circle i=join c=black;
symbol2 v=star i=join c=red;
proc arima data=a;
identify var=sha nlag=22;
run;

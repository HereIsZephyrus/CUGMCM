 data example4_1;
input x@@;
t=_n_;
cards;
12.79 	14.02 	12.92 	18.27 	21.22 	18.81 
25.73 	26.27 	26.75 	28.73 	31.71 	33.95 
;
proc autoreg  data=example4_1;
model x=t;
output out=result p=xcap;
proc gplot data=result;
plot x*t=1 xcap*t=2/overlay;
symbol1 c=black v=star i=none;
symbol2 c=red v=none i=join;
run;

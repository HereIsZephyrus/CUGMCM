data example5_1;
input x@@;
difx=dif(x);
t=_n_;
cards;
1.05 	-0.84 	-1.42 	0.20 	2.81 	6.72 	5.40 	4.38 
5.52 	4.46 	2.89 	-0.43 	-4.86 	-8.54 	-11.54 	-16.22 
-19.41 	-21.61 	-22.51 	-23.51 	-24.49 	-25.54 	-24.06 	-23.44 
-23.41 	-24.17 	-21.58 	-19.00 	-14.14 	-12.69 	-9.48 	-10.29 
-9.88 	-8.33 	-4.67 	-2.97 	-2.91 	-1.86 	-1.91 	-0.80 
;
proc gplot;
plot x*t difx*t;
symbol v=star c=black i=join;
proc arima;
identify var=x(1);
estimate p=1;
forecast lead=5 id=t out=out;
proc gplot data=out;
plot x*t=1 forecast*t=2 l95*t=3 u95*t=3/overlay;
symbol1 c=black i=none v=star;
symbol2 c=red i=join v=none;
symbol3 c=green I=join v=none;
run;

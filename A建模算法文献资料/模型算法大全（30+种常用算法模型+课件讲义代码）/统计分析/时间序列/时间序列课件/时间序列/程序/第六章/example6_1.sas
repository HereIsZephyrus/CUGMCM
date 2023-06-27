  data example6_1;                                                                                                                           
input x y@@;                                                                                                                              
t=_n_;                                                                                                                                  
cards;
-2.94 	9.83 	-2.14 	12.63 	1.01 	14.77 
2.84 	17.29 	-0.79 	18.07 	1.46 	17.38 
5.44 	19.17 	1.65 	9.12 	6.53 	22.82 
8.93 	23.58 	8.67 	15.19 	8.36 	22.43 
9.79 	17.83 	11.67 	25.49 	9.70 	28.40 
9.18 	23.15 	11.13 	19.70 	9.39 	22.32 
12.89 	30.01 	8.45 	21.27 	6.66 	11.52 
4.15 	15.57 	2.57 	9.91 	2.29 	23.28 
-3.28 	13.75 	-5.21 	3.38 	-3.74 	15.81 
-8.73 	12.41 	-15.89 	5.54 	-12.15 	4.83 
-10.86 	14.79 	-17.16 	4.14 	-18.55 	-5.36 
-11.42 	4.79 	-16.02 	0.91 	-14.36 	-5.49 
-17.98 	6.01 	-16.94 	2.78 	-17.52 	-2.49 
-13.44 	10.30 	-14.11 	-0.32 	-15.16 	2.35 
;
proc gplot data=example6_1;
plot x*t=1 y*t=2/overlay;
symbol1 c=black i=join v=none;
symbol2 c=red i=join v=none w=2 l=2;
proc arima data=example6_1;
identify var=x stationarity=(adf=1);                                                                                                                                                                                                 
identify var=y stationarity=(adf=1); 
proc reg data= example6_1;
model y=x;
output out=out residual=residual;
proc arima data=out;
identify var=residual stationarity=(adf);
proc arima data=example6_1;
identify var=y crosscorr=x;  
estimate input=x plot;
forecast lead=5 id=t out=result;
proc gplot data=result;
plot y*t=1 forecast*t=2 l95*t=3 u95*t=3/overlay;
symbol1 c=black i=none v=star;
symbol2 c=rd i=join v=none;
symbol3 c=green i=join v=none;
run;


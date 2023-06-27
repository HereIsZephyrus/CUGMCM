data ex1;
input price @@;
time=intnx('week','13oct2006'd,_n_-1);
format time date7.;
cards;
10.3000 8.5269 9.0421 10.1727 9.9079 8.9714 9.0145 9.4738 9.5258 9.7017
10.0582 9.5292 8.9786 9.1743 9.8478 9.6218 9.0342 9.1891 9.6062 9.8946 
9.4853 9.2557 9.2805 9.5258 10.1192 9.6384 8.8495 9.2644 9.4939 9.6623
9.4212 9.5570 9.7627 9.5639 8.7962 9.1777 10.2288 10.3722 9.0861 8.8148  
9.2055 9.4473 9.2903 9.5358 9.5294 9.5368 9.4168 9.3237 9.5939 9.8874  
10.3007 9.3051 8.6804 9.5337 9.8757 9.2799 9.3030 10.0135 10.1025 10.1310
9.6605 9.8175 9.4935 9.0052 9.2178 10.0131 9.6019 9.4843 9.2807 9.4567
;
run;
proc gplot;
plot price*time/ vaxis=8.5 to 10.5 by 0.1;
symbol i=join v=star cv=red ci=green;
run;
/*proc arima data=ex1;
identify var=price;
run;*/
/*proc arima data=ex1;
identify var=price minic p=(0:6) q=(0:6);
run;*/
proc arima data=ex1;
identify var=price;
estimate p=2 method=ml;
run;

data datas1;
  input x_t @@;
  time=intnx('day','01jan2014'd,_n_-1);
  format time monyy.;
  cards;
    10	15	10	10	12	10	7	7	10	14	8	17
    14	18	3	9	11	10	6	12	14	10	25	29
    33	33	12	19	16	19	19	12	34	15	36	29
    26	21	17	19	13	20	24	12	6	14	6	12
    9	11	17	12	8	14	14	12	5	8	10	3
    16	8	8	7	12	6	10	8	10	5		
;
run;
proc gplot data = datas1;
plot x_t*time;
symbol i=join v=star cv=red ci=green;
run;
proc arima data = datas1;
identify var=x_t nlag=24; 
run;
data datas2;
set datas1;
y_t = dif1(x_t);
run;
proc gplot data = datas2;
plot y_t*time;
symbol i=join v=star cv=red ci=green;
run;
proc arima data = datas2;
identify var=y_t nlag=24; 
run;

data example2_2;
input  freq@@;
year=intnx('year','1jan1970'd,_n_-1);
format year year4.;
cards;
97 154 101 149 221 157 128 215 129 239 155 238 276
204 136 296 176 307 154 227 200 291 233 356 221 309
321 156 234 432 278 356 254 349 322 254 327 432 401
;
proc gplot;
plot freq*year;
symbol v=square c=red i=join;
proc arima data= example2_2;
identify var=freq nlag=22;
run;


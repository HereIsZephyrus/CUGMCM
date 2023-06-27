data example2_2;
input  freq@@;
year=intnx('year','1jan1970'd,_n_-1);
format year year4.;
cards;
97 154 137.7 149 164 157 188 204 179 210 202 218 209
204 211 206 214 217 210 217 219 211 233 316 221 239
215 228 219 239 224 234 227 298 332 245 357 301 389
;
proc arima data= example2_2;
identify var=freq ;
run;

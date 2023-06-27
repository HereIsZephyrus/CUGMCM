data ingots;
input Heat Soak r n @@;
datalines;
7 1.0 0 10 14 1.0 0 31 27 1.0 1 56 51 1.0 3 13
7 1.7 0 17 14 1.7 0 43 27 1.7 4 44 51 1.7 0 1
7 2.2 0 7 14 2.2 2 33 27 2.2 0 21 51 2.2 0 1
7 2.8 0 12 14 2.8 0 31 27 2.8 1 22 51 4.0 0 1
7 4.0 0 9 14 4.0 0 19 27 4.0 1 16
;
run;
ods graphics on;
proc logistic data=ingots;
model r/n = Heat | Soak;
oddsratio Heat / at(Soak=1 2 3 4);
run;
ods graphics off;

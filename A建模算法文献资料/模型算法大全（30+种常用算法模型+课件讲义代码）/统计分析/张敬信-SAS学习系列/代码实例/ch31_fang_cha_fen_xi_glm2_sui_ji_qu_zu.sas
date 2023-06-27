data pack;
input treat $ n;
do block=1 to n;
input y @@;
output;
end;
datalines;
A1 2
12 18
A2 3
14 12 13
A3 3
19 17 21
A4 2
24 30
;
run;
proc print data = pack;
title 'Sales for Four Different Pack';
run;
proc glm data = pack;
class block treat;
model y = block treat;
means block treat / SNK;
means block treat / DUNNETT('1');
means block treat;
run;

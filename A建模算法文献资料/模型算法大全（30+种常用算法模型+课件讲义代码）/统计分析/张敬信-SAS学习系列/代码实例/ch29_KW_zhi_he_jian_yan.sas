data colleges ;
do group=1 to 3;
  input n;
    do i=1 to n;
    input x @@;
    output;
  end;
end;
datalines;
7
25 70 60 85 95 90 80
6
60 20 30 15 40 35
7
50 70 60 80 90 70 75
;
run;
proc print data = colleges;
title '原始数据';
run;
proc npar1way data = colleges wilcoxon;
class group;
var x;
run;
proc freq data = colleges formachar= '|----|+--';
tables group*x / scores = rank cmh;
run;

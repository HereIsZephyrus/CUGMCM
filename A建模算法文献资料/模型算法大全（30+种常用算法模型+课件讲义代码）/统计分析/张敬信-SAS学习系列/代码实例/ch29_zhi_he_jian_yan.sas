data noshows ;
do group=1 to 2;
  input n;
  do i=1 to n;
    input x @@;
    output;
  end;
end;
drop i n;
datalines;
9
11 15 10 18 11 20 24 22 25
8
13 14 10 8 16 9 17 21
;
run;
proc print data = noshows;
title '原始数据';
run;
proc npar1way data = noshows wilcoxon;
class group;
var x;
run;

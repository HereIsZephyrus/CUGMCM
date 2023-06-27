data class;
infile 'c:\MyRawData\Scores.dat';
input Score @@;
run;
proc univariate NORMAL data = class;
var Score;
title;
run;

data Economics;
infile 'C:\MyRawData\Economics.txt';
input Province $ x1 x2 x3 x4 x5 x6 x7 x8;
run;
proc factor data = Economics n=3 SIMPLE CORR plots=(scree);
var x1-x8;
run;
proc factor data = Economics n=3 ROTATE = VARIMAX REORDER plots=(initloadings preloadings loadings);
var x1-x8;
run;
proc factor data = Economics n=3 ROTATE=VARIMAX SCORE OUT=Out;
run;
proc print data = Out;
var Province factor1 factor2 factor3;
run;
proc plot data = Out;
plot factor2*factor1 $Province = '*'/ href=0 vref=0;
run;


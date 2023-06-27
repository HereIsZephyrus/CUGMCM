data booklengths;
infile 'c:\MyRawData\Picbooks.dat';
input NumberOfPages @@;
run;
*Produce summary statistics;
proc means data = booklengths N MEAN MEDIAN CLM ALPHA = 0.10 MAXDEC = 2;
title 'Summary of Picture Book Lengths';
run;

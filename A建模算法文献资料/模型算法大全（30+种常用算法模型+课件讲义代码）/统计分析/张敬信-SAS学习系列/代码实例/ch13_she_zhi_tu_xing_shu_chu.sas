data wings;
infile 'c:\MyRawData\Birds.dat';
input Name $12. Type $ Length Wingspan @@;
run;
* Plot Wingspan by Length;
ODS LISTING GPATH ='c:\MyGraphs' STYLE = JOURNAL;
ODS GRAPHICS / RESET
imagename = 'BirdGraph'
outputfmt = BMP
HEIGHT = 2IN WIDTH = 3IN;
proc sgplot data = wings;
scatter X =Wingspan Y = Length;
title 'Comparison of ''Wingspan vs. Length';
run;

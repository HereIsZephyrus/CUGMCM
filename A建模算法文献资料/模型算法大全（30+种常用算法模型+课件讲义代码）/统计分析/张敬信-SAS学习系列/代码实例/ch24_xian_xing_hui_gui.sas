data hits;
infile 'c:\MyRawData\Baseball.dat';
input Height Distance @@;
run;
proc reg data = hits PLOTS(ONLY) = (DIAGNOSTICS FITPLOT);
model Distance = Height /r clm cli dw;
title 'Results of Regression Analysis';
run;

* Choose only comedies;
data comedy;
infile 'c:\MyRawData\Shakespeare.dat';
input Title $ 1-26 Year Type $;
if Type = 'comedy';
run;
proc print data = comedy;
title 'Shakespearean Comedies';
run;

data wings;
infile 'c:\MyRawData\Birds.dat';
input Name $12. Type $ Length Wingspan @@;
run;
* Plot Wingspan by Length;
proc format;
value $birdtype
'S' = 'Songbirds'
'R' = 'Raptors';
run;
proc sgplot data = wings;
scatter X = Wingspan Y = Length / GROUP = Type 
MARKERATTRS = (SYMBOL = PLUS SIZE = 2MM);
format Type $birdtype.;
title 'Comparison of Wingspan vs. Length';
run;

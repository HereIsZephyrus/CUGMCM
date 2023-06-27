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
proc sgpanel data = wings;
panelby Type / NOVARNAME SPACING = 5;
scatter X = Wingspan Y = Length;
format Type $birdtype.;
title 'Comparison of Wingspan vs. Length';
run;

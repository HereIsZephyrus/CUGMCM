data toads;
infile 'c:\MyRawData\ToadJump.dat'; 
input ToadName $ Weight Jump1 Jump2 Jump3;
run;
proc print data = toads;
title 'SAS Data Set Toads';
run;

data bikerace;
infile 'c:\MyRawData\Criterium.dat';
input Division $ NumberLaps @@;
run;
* Create box plot;
proc sgplot data = bikerace;
vbox NumberLaps / CATEGORY = Division;
title 'Bicycle Criterium Results by Division';
run;

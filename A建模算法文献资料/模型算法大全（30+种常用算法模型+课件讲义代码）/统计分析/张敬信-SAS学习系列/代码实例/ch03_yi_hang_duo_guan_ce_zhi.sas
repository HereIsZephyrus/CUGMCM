data rainfall;
infile 'c:\MyRawData\Precipitation.dat';
input City $ State $ NormalRain MeanDaysRain @@;
run;
proc print data = rainfall;
title1 'Normal Total Precipitation and';
title2 'Mean Days with Precipitation for July';
run;

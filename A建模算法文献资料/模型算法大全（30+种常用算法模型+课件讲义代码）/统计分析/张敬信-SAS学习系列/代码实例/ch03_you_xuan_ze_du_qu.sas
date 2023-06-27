data freeways;
infile 'c:\MyRawData\Traffic.dat';
input Type $ @;
if Type = 'surface' then DELETE;
input Name $ 9-38 AMTraffic PMTraffic;
run;
proc print data = freeways;
title 'Traffic for Freeways';
run;

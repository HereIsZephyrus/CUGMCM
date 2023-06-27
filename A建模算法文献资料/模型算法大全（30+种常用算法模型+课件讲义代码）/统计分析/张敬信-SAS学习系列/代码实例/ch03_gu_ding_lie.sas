data sales;
infile 'c:\MyRawData\OnionRing.dat';
input VisitingTeam $ 1-20 ConcessionSales 21-24 BleacherSales 25-28
OurHits 29-31 TheirHits 32-34 OurRuns 35-37 TheirRuns 38-40;
run;
proc print data = sales;
title 'SAS Data Set Sales';
run;

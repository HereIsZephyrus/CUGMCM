data highlow;
infile 'c:\MyRawData\Temperature.dat';
input City $ State $
/ NormalHigh NormalLow
#3 RecordHigh RecordLow;
run;
proc print data = highlow;
title 'High and Low Temperatures for July';
run;

data orders;
infile 'c:\MyRawData\Coffee.dat';
input Coffee $ Window $ @@;
* Print tables for Window and Window by Coffee;
proc freq data = orders;
tables Window Window * Coffee;
* ���������Window�ĵ����Window �� Coffee ˫���;
title;
run;

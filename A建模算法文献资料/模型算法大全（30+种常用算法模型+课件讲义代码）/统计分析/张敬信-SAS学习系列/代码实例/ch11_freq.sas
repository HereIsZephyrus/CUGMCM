data orders;
infile 'c:\MyRawData\Coffee.dat';
input Coffee $ Window $ @@;
* Print tables for Window and Window by Coffee;
proc freq data = orders;
tables Window Window * Coffee;
* 输出两个表：Window的单向表、Window 和 Coffee 双向表;
title;
run;

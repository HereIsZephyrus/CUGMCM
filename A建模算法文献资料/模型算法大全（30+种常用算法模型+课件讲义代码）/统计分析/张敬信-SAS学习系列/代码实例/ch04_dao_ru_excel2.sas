proc import datafile = 'D:\ÎÒµÄÎÄµµ\My SAS Files\9.3\exercise.xlsx' DBMS=EXCEL OUT = results REPLACE;
SHEET = 'tests2';
RANGE = '$A1:H10';
GETNAMES = YES;
run;
proc print data = results;
title 'SAS Data Set Read From Excel File';
run;



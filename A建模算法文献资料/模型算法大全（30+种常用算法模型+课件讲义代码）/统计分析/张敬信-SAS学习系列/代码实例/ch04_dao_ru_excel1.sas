libname results 'D:\ÎÒµÄÎÄµµ\My SAS Files\9.3\exercise.xlsx';
proc print data=results.'tests1$'n;
run;
libname results clear;

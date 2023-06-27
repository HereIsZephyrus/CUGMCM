data invents;
infile 'D:\ÎÒµÄÎÄµµ\My SAS Files\9.3\invent.dat';
input Item $ 1-13 IDnum $ 15-19
InStock 21-22 BackOrd 24-25;
Total=instock+backord;
run;
proc print data = invents;
run;

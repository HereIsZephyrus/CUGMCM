data newcalc;
infile 'D:\ÎÒµÄÎÄµµ\My SAS Files\9.3\newloans.dat';
input LoanID $ 1-4 Rate 5-8 Amount 9-19;
if rate>0 then
Interest=amount*(rate/12);
else put 'DATA ERROR ' rate= _n_=;
run;
proc print data = newcalc;
run;

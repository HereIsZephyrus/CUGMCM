data shoes;
infile 'c:\MyRawData\Shoesales.dat';
input Style $ 1-15 ExerciseType $ Sales;
run;
/* Output grand total of sales to a data set and print; */
proc means NOPRINT data = shoes;
var Sales;
output out = summarydata sum(Sales) = GrandTotal;
RUN;
proc print data = summarydata;
title 'Summary Data Set';
run;
/* Combine the grand total with the original data; */
data shoesummary;
if _N_ = 1 then set summarydata;
set shoes;
Percent = Sales / GrandTotal;
run;
proc print data = shoesummary;
var Style ExerciseType Sales GrandTotal Percent;
format Percent PERCENT.2;
title 'Overall Sales Share';
run;

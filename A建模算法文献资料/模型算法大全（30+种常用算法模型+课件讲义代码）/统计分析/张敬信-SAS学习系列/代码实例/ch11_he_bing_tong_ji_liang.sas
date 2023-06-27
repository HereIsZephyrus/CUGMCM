data shoes;
infile 'c:\MyRawData\Shoesales.dat';
input Style $ 1-15 ExerciseType $ Sales;
run;
proc sort data = shoes;
by ExerciseType;
run;
/* Summarize sales by ExerciseType and print; */
proc means NOPRINT data = shoes;
var Sales;
by ExerciseType;
output out = summarydata sum(Sales) = Total;
run;
proc print data = summarydata;
title 'Summary Data Set';
run;
/* Merge totals with the original data set; */
data shoesummary;
merge shoes summarydata;
by ExerciseType;
Percent = Sales / Total * 100;
run;
proc print data = shoesummary;
by ExerciseType;
id ExerciseType;
var Style Sales Total Percent;
title 'Sales Share by Type of Exercise';
run;

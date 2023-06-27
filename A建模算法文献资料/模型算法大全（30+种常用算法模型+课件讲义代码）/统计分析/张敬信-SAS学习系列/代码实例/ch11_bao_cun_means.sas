data sales;
infile 'c:\MyRawData\Flowers.dat';
input CustID $ @9 SaleDate MMDDYY10. Petunia SnapDragon Marigold;
proc sort data = sales;
by CustID;
/* Calculate means by CustomerID, output sum and mean to new data set; */
proc means NOPRINT data = sales;
by CustID;
var Petunia SnapDragon Marigold;
output out = totals
mean(Petunia SnapDragon Marigold) = MeanP MeanSD MeanM
sum(Petunia SnapDragon Marigold) = Petunia SnapDragon Marigold;
proc print data = totals;
title 'Sum of Flower Data over Customer ID';
format MeanP MeanSD MeanM 3.;
run;

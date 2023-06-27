data sales;
infile 'c:\MyRawData\Flowers.dat';
input CustID $ @9 SaleDate MMDDYY10. Petunia SnapDragon Marigold;
Month = MONTH(SaleDate);
proc sort data = sales;
by Month;
/* Calculate means by Month for flower sales; */
proc means data = sales MAXDEC = 0;
by Month;
var Petunia SnapDragon Marigold;
title 'Summary of Flower Sales by Month';
run;

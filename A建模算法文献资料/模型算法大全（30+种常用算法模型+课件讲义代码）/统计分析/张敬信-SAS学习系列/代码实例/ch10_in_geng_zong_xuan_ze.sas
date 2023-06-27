data customer;
infile 'c:\MyRawData\CustAddress.dat' TRUNCOVER;
input CustomerNumber Name $ 5-21 Address $ 23-42;
data orders;
infile 'c:\MyRawData\OrdersQ3.dat';
input CustomerNumber Total;
proc sort data = orders;
by CustomerNumber;
run;
/* Combine the data sets using the IN= option; */
data noorders;
merge customer orders (IN = Recent);
by CustomerNumber;
if Recent = 0;
run;
proc print data = noorders;
title 'Customers with No Orders in the Third Quarter';
run;

data nationalparks;
infile 'c:\MyRawData\NatPark.dat';
input ParkName $ 1-22 State $ Year @40 Acreage COMMA9.;
run;
proc print data = nationalparks;
title 'Selected National Parks';
run;

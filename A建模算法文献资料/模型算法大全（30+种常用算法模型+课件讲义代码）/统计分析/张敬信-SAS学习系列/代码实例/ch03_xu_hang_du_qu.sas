data homeaddress;
infile 'c:\MyRawData\Address.dat' TRUNCOVER;
input Name $ 1-15 Number 16-19 Street $ 22-37;
run;
proc print data = homeaddress;
run;

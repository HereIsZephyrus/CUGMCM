data class102;
infile 'c:\MyRawData\AllScores.dat' MISSOVER;
input Name $ Test1 Test2 Test3 Test4 Test5;
run;
proc print data = class102;
run;

data weblogs;
infile 'C:\MyRawData\weblogs.txt';
input @'[' AccessDate DATE11. @'GET' File :$20.;
proc print data = weblogs;
title 'Dog Care Web Logs';
run;

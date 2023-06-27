data canoeresults;
infile 'c:\MyRawData\Canoes.dat';
input @'School:' School $ @'Time:' RaceTime :STIMER8.;
run;
proc print data = canoeresults;
title "Concrete Canoe Men's Sprint Results";
run;

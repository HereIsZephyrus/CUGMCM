data tallpeaks (WHERE = (Height > 6000))
american (WHERE = (Continent CONTAINS ('America')));
infile 'c:\MyRawData\Mountains.dat';
input Name $1-14 Continent $15-28 Height;
run;
proc print data = tallpeaks;
title 'Members of the Seven Summits above 6,000 Meters';
run;
proc print data = american;
title 'Members of the Seven Summits in the Americas';
run;

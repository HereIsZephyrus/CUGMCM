data boats;
infile 'c:\MyRawData\Boats.dat';
input Name $ 1-12 Port $ 14-20 Locomotion $ 22-26 Type $ 28-30 Price 32-37 Length 39-41;
run;
* Changing headers;
proc FORMAT;
value $typ 'cat' = 'catamaran'
           'sch' = 'schooner'
           'yac' = 'yacht';
proc tabulate data = boats FORMAT=DOLLAR9.2;
class Locomotion Type;
var Price;
format Type $typ.;
table Locomotion='' ALL='All', MEAN=''*Price='Mean Price by Type of Boat'*(Type='' ALL='All') /BOX='Full Day Excursions' MISSTEXT='none';
title;
run;
TABLE MEAN=''*Sales='Mean Sales by Region',Region=''/ROW=FLOAT;

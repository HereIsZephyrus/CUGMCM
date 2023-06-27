data carsurvey;
infile 'c:\MyRawData\Cars0.dat';
input Age Sex Income Color $;
proc format;
value gender 1 = 'Male'
             2 = 'Female';
value agegroup 13 -< 20 = 'Teen'
               20 -< 65 = 'Adult'
              65 - HIGH = 'Senior';
value $col 'W' = 'Moon White'
           'B' = 'Sky Blue'
           'Y' = 'Sunburst Yellow'
           'G' = 'Rain Cloud Gray';
* Print data using user-defined and standard (DOLLAR8.) formats;
proc print data = carsurvey;
format Sex gender. Age agegroup. Color $col. Income DOLLAR8.;
title 'Survey Results Printed with User-Defined Formats';
run;

data music;
infile 'c:\MyRawData\Bands.csv' DLM = ',' DSD MISSOVER;
input BandName:$30. GigDate:MMDDYY10. EightPM NinePM TenPM ElevenPM;
run;
proc print data = music;
title 'Customers at Each Gig';
run;

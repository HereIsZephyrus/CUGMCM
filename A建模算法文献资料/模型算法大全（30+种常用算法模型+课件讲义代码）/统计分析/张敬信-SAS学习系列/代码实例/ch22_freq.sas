data bus;
infile 'c:\MyRawData\Bus.dat';
input BusType $ OnTimeOrLate $ @@;
run;
proc format;
value $type 'R'='Regular'
            'E'='Express';
value $late 'O'='On Time'
            'L'='Late';
run;
proc freq data = bus;
tables BusType * OnTimeOrLate / NOROW NOCOL CHISQ PLOTS=FREQPLOT(TWOWAY=GROUPHORIZONTAL);
format BusType $Type. OnTimeOrLate $Late.;
run;

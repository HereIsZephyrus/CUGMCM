DATA boats;
INFILE 'c:\MyRawData\Boats.dat';
INPUT Name $ 1-12 Port $ 14-20 Locomotion $ 22-26 Type $ 28-30
Price 32-37 Length 39-41;
RUN;
* Tabulations with two dimensions and statistics;
PROC TABULATE DATA = boats;
CLASS Locomotion Type;
VAR Price;
TABLE Locomotion ALL, MEAN*Price*(Type ALL);
TITLE 'Mean Price by Locomotion and Type';
RUN;

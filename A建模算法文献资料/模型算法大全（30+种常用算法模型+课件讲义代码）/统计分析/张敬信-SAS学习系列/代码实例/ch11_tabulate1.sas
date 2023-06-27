DATA boats;
INFILE 'c:\MyRawData\Boats.dat';
INPUT Name $ 1-12 Port $ 14-20 Locomotion $ 22-26 Type $ 28-30
Price 32-37 Length 39-41;
RUN;
* Tabulations with three dimensions;
PROC TABULATE DATA = boats;
CLASS Port Locomotion Type;
TABLE Port, Locomotion, Type;
TITLE 'Number of Boats by Port, Locomotion, and Type';
RUN;

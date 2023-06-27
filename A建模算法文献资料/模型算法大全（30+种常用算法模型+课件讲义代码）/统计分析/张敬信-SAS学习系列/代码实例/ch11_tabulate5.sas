DATA boats;
INFILE 'c:\MyRawData\Boats.dat';
INPUT Name $ 1-12 Port $ 14-20 Locomotion $ 22-26 Type $ 28-30
Price 32-37 Length 39-41;
RUN;
* Using the FORMAT= option in the TABLE statement;
PROC TABULATE DATA = boats;
CLASS Locomotion Type;
VAR Price Length;
TABLE Locomotion ALL,MEAN * (Price*FORMAT=DOLLAR7.2 Length*FORMAT=2.0) * (Type ALL);
TITLE 'Price and Length by Type of Boat';
RUN;

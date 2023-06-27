
data contest;
infile 'c:\MyRawData\Pumpkin.dat';
input Name $16. Age 3. +1 Type $1. +1 Date MMDDYY10.
(Score1 Score2 Score3 Score4 Score5) (4.1);
run;
proc print data = contest;
title 'Pumpkin Carving Contest';
run;

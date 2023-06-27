data contest;
infile 'c:\MyRawData\Pumpkin.dat';
input Name $16. Age 3. +1 Type $1. +1 Date MMDDYY10.
(Scr1 Scr2 Scr3 Scr4 Scr5) (4.1);
AvgScore = MEAN(Scr1, Scr2, Scr3, Scr4, Scr5);
DayEntered = DAY(Date);
Type = UPCASE(Type);  /* ת��Ϊ��д */
run;
proc print data = contest;
title 'Pumpkin Carving Contest';
run;

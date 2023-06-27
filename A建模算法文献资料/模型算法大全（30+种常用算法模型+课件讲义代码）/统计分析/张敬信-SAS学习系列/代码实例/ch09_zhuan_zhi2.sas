data baseball;
infile 'c:\MyRawData\Transpos.dat';
input Team $ Player Type $ Entry;
proc sort data = baseball;
by Team Player;
proc print data = baseball;
title 'Baseball Data After Sorting and Before Transposing';
run;
/* Transpose data so salary and batavg are variables;*/
proc transpose data = baseball OUT = flipped;
by Team Player; /* 原 Team 列和 Player 列不参与转置 */
id Type;    /* Type 列的值 salary 和 batavg 作为转置数据的变量名 */
var Entry;  /* 原 Entry 列转置 */
proc print data = flipped;
title 'Baseball Data After Transposing';
run;

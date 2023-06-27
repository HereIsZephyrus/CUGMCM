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
by Team Player; /* ԭ Team �к� Player �в�����ת�� */
id Type;    /* Type �е�ֵ salary �� batavg ��Ϊת�����ݵı����� */
var Entry;  /* ԭ Entry ��ת�� */
proc print data = flipped;
title 'Baseball Data After Transposing';
run;

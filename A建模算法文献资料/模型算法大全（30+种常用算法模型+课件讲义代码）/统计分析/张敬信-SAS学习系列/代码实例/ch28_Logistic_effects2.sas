data effects2;
input sex degree effect count @@;
cards;
0 0 1 21  0 0 0 6  0 1 1 9  0 1 0 9
1 0 1 8   1 0 0 10 1 1 1 4  1 1 0 11
;
run;
proc logistic data = effects2 DESCENDING;
freq count;
model effect = sex degree / scale=none aggregate;  *ģ�͵�����Ŷȼ���;
output out=predict pred=prob; *output�������������,����������predict�����У�Ԥ��ֵΪprob; 
run;
proc print data=predict;
run;
*���������Ա����Ľ�������;
proc logistic data = effects2 DESCENDING;
freq count;
model effect = sex degree sex*degree;
run;

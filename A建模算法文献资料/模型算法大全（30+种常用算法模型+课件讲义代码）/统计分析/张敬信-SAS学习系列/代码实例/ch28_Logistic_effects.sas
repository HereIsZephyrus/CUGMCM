data effects;
input treat effect count;
cards;
1 1 16
1 0 48
2 1 40
2 0 20
;
proc logistic data = effects DESCENDING; 
freq count;               
model effect=treat; /*������ model effect(event='1') = treat; ǰ��Ϳ��Բ���DESCENDINGѡ����*/
output out = 
run;

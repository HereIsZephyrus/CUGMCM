proc print data=Sasuser.admit label;
var actlevel height weight;
label actlevel='Activity Level'
      height='Height in Inches'  /* Ҳ����ÿ����ǩ������label�������� */
      weight='Weight in Pounds';
run;

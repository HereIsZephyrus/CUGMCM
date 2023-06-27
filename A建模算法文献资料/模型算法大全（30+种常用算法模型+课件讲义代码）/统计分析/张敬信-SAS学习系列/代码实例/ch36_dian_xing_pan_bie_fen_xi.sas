 proc candisc data=iris out=outcan distance anova;
 class species;
 var sepallen sepalwid petallen petalwid;
 title 'Using Canonical Discriminant Analysis';
 run;
 proc print data=outcan;
 title 'outcan';
 run;
 proc format;
 value specfmt   1 = '+'
                 2 = 'c'
                 3 = '*';
run;
proc plot data=outcan formchar='|----|---' vpct=50 hpct=80;
plot can2*can1=species;
format species specfmt.;
title2 'Plot of Canonical Variables';
run;
/* formachar(1,2,7)=�������ַ��������涨��������������������ߺͷָ��ߵ��ַ���
ȱʡֵΪformachar(1,2,7)=��|��+����
��һ���ַ�������ʾ��ֱ�ߣ��ڶ����ַ�������ʾˮƽ�ߣ��������ַ�������ʾˮƽ�봹ֱ�Ľ����ߣ�*/

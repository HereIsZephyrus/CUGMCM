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
/* formachar(1,2,7)=’三个字符’——规定用来构造列联表的轮廓线和分隔线的字符；
缺省值为formachar(1,2,7)=’|－+’，
第一个字符用来表示垂直线，第二个字符用来表示水平线，第三个字符用来表示水平与垂直的交叉线；*/

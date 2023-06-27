data Test;
input Name $1-9 Subject 11-12 Gender $ 14 Exam1 16-18 Exam2 20-22 HW_Grade $ 24;
datalines;       /* datalines, 数据行开始标志 */
Xiao Er   10 M 80  84  A
Zhang San 7  M 85  89  A
Li Si     4  F 90  86  B
Wang Wu   20 M 82  85  B
Zhao Liu  25 F 94  94  A
Liu Qi    14 F 88  84  C
;                 /* 分号, 为数据行结束标志 */
run;
proc print data=Test;
title '学生测验成绩';
run;
proc means data=Test;
title '学生测验成绩分析'; 
run;

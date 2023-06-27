data Test;
infile 'c:\MyRawData\tests.txt';
input Name $1-9 Subject 11-12 Gender $ 14 Exam1 16-18 Exam2 20-22 Homework $ 24;
run;
proc print data=Test;
title 'Test';
run;
data Test1 (DROP = Subject Homework RENAME =(Name = Student Name)); 
   /* 用 (KEEP = Name Gender Exam1 Exam2) 也一样效果 */
set Test;
proc print data = Test1;
title 'Test1';
run;

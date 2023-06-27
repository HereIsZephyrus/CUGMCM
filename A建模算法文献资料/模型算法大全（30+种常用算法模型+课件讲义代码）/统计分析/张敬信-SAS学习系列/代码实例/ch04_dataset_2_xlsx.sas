libname  myxlsx  EXCEL 'D:\ÎÒµÄÎÄµµ\My SAS Files\9.3\exercise2.xlsx';
data myxlsx.tests1 (dblabel=YES);
set Sasuser.Admit;
run;
data myxlsx.tests2 (dblabel=YES);
set Sasuser.Admit2;
run;
libname myxlsx clear;


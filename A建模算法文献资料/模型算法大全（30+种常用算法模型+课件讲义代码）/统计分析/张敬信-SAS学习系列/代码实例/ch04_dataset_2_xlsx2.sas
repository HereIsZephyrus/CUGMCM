proc export data = Sasuser.Admit outfile = 'D:\�ҵ��ĵ�\My SAS Files\9.3\exercise1.xlsx' DBMS=EXCEL REPLACE;
SHEET = "test1";
MIXED=YES;
run;

libname mylib 'D:\�ҵ��ĵ�\My SAS Files\9.3';
data newpatients;
set mylib.patients;
Sex=upcase(Sex);
if Sex='G' then Sex='F';
if Age>110 then delete;
run;
proc print data = mylib.patients;
run;
proc print data = newpatients;
run;

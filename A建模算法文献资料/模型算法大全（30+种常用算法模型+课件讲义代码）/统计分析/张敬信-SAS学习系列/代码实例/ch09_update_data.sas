libname perm 'D:\ÎÒµÄÎÄµµ\My SAS Files\9.3';
data perm.patientmaster;
infile 'c:\MyRawData\Admit.dat';
input Account LastName $ 8-16 Address $ 17-34
BirthDate MMDDYY10. Sex $ InsCode $ 48-50 @52 LastUpdate MMDDYY10.;
run;
data perm.transactions;
infile 'c:\MyRawData\NewAdmit.dat';
input Account LastName $ 8-16 Address $ 17-34 BirthDate MMDDYY10.
Sex $ InsCode $ 48-50 @52 LastUpdate MMDDYY10.;
run;
proc sort data = transactions;
by Account;
run;
* Update patient data with transactions;
data perm.patientmaster;
update perm.patientmaster transactions;
by Account;
run;
proc print data = perm.patientmaster;
format BirthDate LastUpdate MMDDYY10.;
title 'Admissions Data';
run;

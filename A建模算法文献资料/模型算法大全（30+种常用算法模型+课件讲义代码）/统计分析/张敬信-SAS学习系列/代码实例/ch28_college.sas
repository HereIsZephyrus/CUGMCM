libname lib 'C:\MyRawData';
data lib.College;
infile 'C:\MyRawData\college.dat';
input Gender 1 KeySchool 3 Grade 5-8 College 10;
MeanGrade = Grade - 83.7;
run;
proc logistic data = lib.College DESCENDING; * DESCENDINGָ����y=1����������Ϊ������󣬷���Ĭ����ָ��Сֵy=0;
model college = Gender KeySchool MeanGrade /LACKFIT SCALE = NONE AGGREGATE;
run;

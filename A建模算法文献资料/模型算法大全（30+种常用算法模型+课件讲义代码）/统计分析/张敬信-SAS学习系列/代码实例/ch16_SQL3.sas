libname sql 'C:\SQLDatas';
proc sql;
title 'Number of Continents in the COUNTRIES Table';
select count(distinct Continent) as Count
/*ʹ�ùؼ���distinc, ֻ�Բ�ͬ��continent����;*/
from sql.countries;
proc sql;
title 'Countries for Which a Continent is Listed';
select count(Continent) as Count
/*ֻ�Է�ȱʡ��continent����;*/
from sql.countries;
proc sql;
title 'Number of Countries in the SQL.COUNTRIES Table';
select count(*) as Number
/*�������м�����������;*/
from sql.countries;
quit;

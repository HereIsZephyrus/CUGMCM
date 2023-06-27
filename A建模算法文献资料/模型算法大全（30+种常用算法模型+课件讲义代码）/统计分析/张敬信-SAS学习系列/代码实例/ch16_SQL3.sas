libname sql 'C:\SQLDatas';
proc sql;
title 'Number of Continents in the COUNTRIES Table';
select count(distinct Continent) as Count
/*使用关键词distinc, 只对不同的continent计数;*/
from sql.countries;
proc sql;
title 'Countries for Which a Continent is Listed';
select count(Continent) as Count
/*只对非缺省的continent计数;*/
from sql.countries;
proc sql;
title 'Number of Countries in the SQL.COUNTRIES Table';
select count(*) as Number
/*对所有行计数（行数）;*/
from sql.countries;
quit;

libname sql 'C:\SQLDatas';
proc sql;
title 'Total Populations of Continents with More than 15 Countries';
select Continent,
sum(Population) as TotalPopulation format=comma16.,
count(*) as Count
from sql.countries
group by Continent
having count(*) gt 15
order by Continent;
quit;

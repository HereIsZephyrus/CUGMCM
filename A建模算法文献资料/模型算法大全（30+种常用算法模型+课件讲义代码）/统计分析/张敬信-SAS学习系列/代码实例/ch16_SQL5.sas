libname sql 'C:\SQLDatas';
proc sql;
title 'Total Populations of World Continents';
select Continent, sum(Population) format=comma14. as TotalPopulation
from sql.countries
where Continent is not missing
group by Continent
order by Continent;
quit;

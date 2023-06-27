libname sql 'C:\SQLDatas';
proc sql outobs=12;
title 'Percentage of World Population in Countries';
select Name, Population format=comma14.,
(Population / sum(Population) * 100) as Percentage
format=comma8.2
from sql.countries
order by Percentage desc;
quit;

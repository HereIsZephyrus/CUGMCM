libname sql 'C:\SQLDatas';
proc sql;
title 'World Population Densities per Square Mile';
select Name, Population format=comma12., Area format=comma8.,
Population/Area as Density format=comma10.
from sql.countries
where Continent = 'Asia' and calculated Density > 1000
order by Density desc;
quit;

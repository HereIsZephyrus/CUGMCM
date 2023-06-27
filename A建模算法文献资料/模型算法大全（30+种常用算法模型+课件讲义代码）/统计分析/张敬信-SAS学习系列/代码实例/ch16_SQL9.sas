libname sql 'C:\SQLDatas';
proc sql;
title 'Coordinates of Capital Cities';
select Capital format=$20., Name 'Country' format=$20.,Latitude, Longitude
from sql.countries a left join sql.worldcitycoords b 
on a.Capital = b.City and a.Name = b.Country
order by Capital;
quit;

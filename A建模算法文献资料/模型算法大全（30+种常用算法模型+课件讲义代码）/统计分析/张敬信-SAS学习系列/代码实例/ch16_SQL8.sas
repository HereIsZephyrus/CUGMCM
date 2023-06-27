libname sql 'C:\SQLDatas';
title 'Coordinates of State Capitals';
proc sql; 
select us.Capital format=$15., us.Name 'State' format=$15.,pc.Code, c.Latitude, c.Longitude
from sql.unitedstates us, sql.postalcodes pc,sql.uscitycoords c
where us.Capital = c.City and us.Name = pc.Name and pc.Code = c.State;
quit;

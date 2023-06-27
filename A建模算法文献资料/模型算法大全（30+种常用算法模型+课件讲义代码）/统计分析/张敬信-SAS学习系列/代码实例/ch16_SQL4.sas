libname sql 'C:\SQLDatas';
proc sql;
title 'Average Length of Angel Falls, Amazon and Nile Rivers';
select Name, Length, avg(Length) as AvgLength
from sql.features
where Name in ('Angel Falls', 'Amazon', 'Nile');
proc sql;
title 'Average Length of Angel Falls, Amazon and Nile Rivers';
select Name, Length, coalesce(Length, 0) as NewLength,
avg(calculated NewLength) as AvgLength
from sql.features
where Name in ('Angel Falls', 'Amazon', 'Nile');
quit;

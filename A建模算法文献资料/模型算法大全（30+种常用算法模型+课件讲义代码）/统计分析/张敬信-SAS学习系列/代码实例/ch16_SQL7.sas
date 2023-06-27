libname sql 'C:\SQLDatas';
proc sql;
create table sql.temp as
select * from sql.oilprod as p, sql.oilrsrvs as r
where p.country = r.country and p.country is not missing
/* 或者用下列语句：
select * from sql.oilprod as p inner join sql.oilrsrvs as r
on p.country = r.country and p.country is not missing  */
order by barrelsperday desc;
quit;


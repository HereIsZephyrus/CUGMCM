data a;
input year x y;
lnx=log(x);
lny=log(y);
cards;
1978	133.6	116.1
1979	160.7	134.5
1980	191.3	162.2
1981	223.4	190.8
1982	270.1	220.2
1983	309.8	248.3
1984	355.3	273.8
1985	397.6	317.4
1986	423.8	357
1987	462.6	398.3
1988	544.9	476.7
1989	601.5	535.4
1990	686.3	584.6
1991	708.6	619.8
1992	784	659.8
1993	921.6	769.7
1994	1221	1016.8
1995	1577.7	1310.4
1996	1926.1	1572.1
1997	2090.1	1617.2
1998	2162	1590.3
1999	2210.3	1577.4
2000	2253.4	1670.1
2001	2366.4	1741
2002	2476	1834
;
proc gplot data=a;
plot lnx*year=1 lny*year=2/overlay;
symbol1 c=black i=join v=circle;
symbol2 c=black i=join v=star;
proc arima data=a;
identify var=lnx stationarity=(adf);
identify var=lny stationarity=(adf);
identify var=lnx(1) stationarity=(adf);
identify var=lny(1) stationarity=(adf);
identify var=lnx(1) stationarity=(pp);
identify var=lny(1) stationarity=(pp);
proc reg;
model lny=lnx /noint;
output out=out residual=residual;
proc arima data=out;
identify var=residual stationarity=(adf);
proc arima data=a;
identify var=lny crosscorr=(lnx);
estimate p=1 input=lnx noint;
forecast lead=10 id=year out=result;
data result;
set result;
y=exp(lny);
estimate=exp(forecast);
proc gplot data=result;
plot lny*year=1 forecast*year=2 /overlay;
plot y*year=1 estimate*year=2 /overlay;
symbol1 c=black i=none v=star;
symbol2 c=red i=join v=none;
data b;
set a;
ecm=lny-0.96832*lnx;
lag_ecm=lag(ecm);
dif_lnx=dif(lnx);
dif_lny=dif(lny);
proc reg data=b;
model dif_lny=dif_lnx lag_ecm /noint;
run;

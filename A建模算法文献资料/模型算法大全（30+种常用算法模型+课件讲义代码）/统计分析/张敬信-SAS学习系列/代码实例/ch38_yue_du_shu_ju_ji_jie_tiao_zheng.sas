data sales;
input sales @@;
date = intnx( 'month', '01jan1993'd, _n_-1 );
format date monyy5.;
datalines;
977.5	892.5	942.3	941.3	962.2	1005.7	963.8	959.8	1023.3	1051.1	1102	1415.5
1192.2	1162.7	1167.5	1170.4	1213.7	1281.1	1251.5	1286	1396.2	1444.1	1553.8	1932.2
1602.2	1491.5	1533.3	1548.7	1585.4	1639.7	1623.6	1637.1	1756	1818	1935.2	2389.5
1909.1	1911.2	1860.1	1854.8	1898.3	1966	1888.7	1916.4	2083.5	2148.3	2290.1	2848.6
2288.5	2213.5	2130.9	2100.5	2108.2	2164.7	2102.5	2104.4	2239.6	2348	2454.9	2881.7
2549.5	2306.4	2279.7	2252.7	2265.2	2326	2286.1	2314.6	2443.1	2536	2652.2	3131.4
2662.1	2538.4	2403.1	2356.8	2364	2428.8	2380.3	2410.9	2604.3	2743.9	2781.5	3405.7
2774.7	2805	2627	2572	2637	2645	2597	2636	2854	3029	3108	3680
;
run;
proc x11 data=sales;
monthly date=date;
var     sales;
arima   maxit=60;
tables  d11;
output  out=out b1=series d10=season d11=adjusted d12=trend d13=irr;
proc print data=out;
run ;
title 'Monthly Retail Sales Data';
proc sgplot data=out;
series x=date y=series / markers
markerattrs=(color=red symbol='asterisk')
lineattrs=(color=red)
legendlabel="original" ;
series x=date y=adjusted / markers
markerattrs=(color=blue symbol='circle')
lineattrs=(color=blue)
legendlabel="adjusted" ;
yaxis label='Original and Seasonally Adjusted Time Series';
run;
title 'Monthly Seasonal Factors (in percent)';
proc sgplot data=out;
series x=date y=season / markers markerattrs=(symbol=CircleFilled) ;
run;
title 'Monthly Retail Sales Data (in $1000)';
proc sgplot data=out;
series x=date y=trend / markers markerattrs=(symbol=CircleFilled) ;
run;
title 'Monthly Irregular Factors (in percent)';
proc sgplot data=out;
series x=date y=irr / markers markerattrs=(symbol=CircleFilled) ;
run;

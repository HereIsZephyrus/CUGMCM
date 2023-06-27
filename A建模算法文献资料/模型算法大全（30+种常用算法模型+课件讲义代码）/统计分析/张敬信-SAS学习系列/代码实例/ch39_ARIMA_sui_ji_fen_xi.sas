data arimad01;
date=intnx('month','31dec1948'd,_n_);
input x @@;
format date monyy5.;
datalines;
112	118	132	129	121	135	148	148	136	119	104	118
115	126	141	135	125	149	170	170	158	133	114	140
145	150	178	163	172	178	199	199	184	162	146	166
171	180	193	181	183	218	230	242	209	191	172	194
196	196	236	235	229	243	264	272	237	211	180	201
204	188	235	227	234	264	302	293	259	229	203	229
242	233	267	269	270	315	364	347	312	274	237	278
284	277	317	313	318	374	413	405	355	306	271	306
315	301	356	348	355	422	465	467	404	347	305	336
340	318	362	348	363	435	491	505	404	359	310	337
360	342	406	396	420	472	548	559	463	407	362	405
417	391	419	461	472	535	622	606	408	461	390	432
;
run;
proc sgplot data=arimad01;
series x=date y=x / markers;
run;
proc arima data=arimad01;
identify var=x;
run;
data arimad02;
set arimad01 ;
xlog=log(x);
run;
proc print data = arimad02;
run;
goptions reset=global gunit=pct cback=white border
             htitle=6 htext=3 ftext=swissb colors=(black);
proc gplot data=arimad02 ;
plot  xlog*date  / vaxis=axis1 haxis=axis2 
href='31dec1949'd to '1jan61'd by year;
plot2   x*date  /vaxis=axis3 vref=100;
symbol1 i=join v=c h=3 l=1 r=1 font=swissb c=green;
symbol2 i=join v=c h=3 l=1 r=1 font=swissb c=blue;
    axis1   label=('Log')       order=(4.5 to 6.5 by 0.5) offset=(0,45);
axis2   label=('12 Month')  order=('1jan49'd to '1jan61'd by year);
axis3   label=('Passenger') order=(100 to 700 by 100) offset=(23,0);
format  date monyy. ;
title1 'Time Serial Log Chart';
run;
data arimad03;
set arimad02;
dif12=dif1(xlog)-(lag1(xlog)-lag12(xlog));
run;
proc gplot data=arimad03 ;
plot    xlog*date   /vaxis=axis1 haxis=axis2 
href='31dec1949'd to '1jan61'd by year;
plot2   dif12*date  /vaxis=axis3 vref=-1;
symbol1 i=join v=c h=3 l=1 r=1 font=swissb c=green;
symbol2 i=join v=c h=3 l=1 r=1 font=swissb c=blue;
axis1   label=('Log')      order=(4.5 to 6.5 by 0.5) offset=(0,45);
axis2   label=('12 Month') order=('1jan49'd to '1jan61'd by year);
axis3   label=('Dif1-12')  order=(-1 to 1 by 0.2) offset=(23,0);
format  date monyy. ;
title1 'Time Serial Dif Chart';
run;
proc arima data=arimad02;
identify  var=xlog(1,12) nlag=15;
run;
proc arima data=arimad03;
identify var=xlog(1,12) nlag=15;
estimate q=(1)(12) p=(1)(12) noconstant outmodel=xmode;
run;
proc arima data=arimad03;
identify  var=xlog(1,12) nlag=15;
estimate  q=(1)(12)  noconstant outmodel=xmode;
forecast lead=12 interval=month id=date out=forxlog;
run;
proc print data=forxlog;
run;
data arimad04;
set forxlog;
x=exp(xlog);
forecast=exp(forecast);
l95=exp(l95);
u95=exp(u95);
proc print data=arimad04;
run;
proc gplot data=arimad04;
where date>='1jan57'd;
plot x*date forecast*date l95*date u95*date /overlay vaxis=axis1 haxis=axis2 href='31dec60'd ;
symbol1 i=join  v=C h=2.5 l=1 font=swissb c=red;
symbol2 i=join  v=F h=3   l=1 font=swissb c=blue;
symbol3 i=join  l=1 font=swissb c=green;
symbol4 i=join  l=1 font=swissb c=green;
axis1   label=('Passenger') order=(250 to 800 by 50);
axis2   label=('Month')     order=('1jan57'd to '1jan62'd by year);
format  date monyy. ;
title1 'Forecast Chart';
title2 'C--x';
title3 'F--forecast';
title4 'None--u95 and l95';
run;





goptions vsize=7cm hsize=10cm;
data na_in;
t=_n_;
time=intnx('year','1jan1952'd,_n_-1);
format time year4.;
input agric     indus   cons    trans   commer;
dif=dif(agric) ;
keep time agric dif;
cards;
100     100     100     100     100
101.6   133.6   138.1   12      133
103.3   159.1   133.3   136     136.4
111.5   169.1   152.4   140     137.5
116.5   219.1   261.9   164     146.6
120.1   244.5   242.9   176     146.6
120.3   383.5   367     270.8   155.9
100.6   501.5   388.6   356.5   170.3
83.6    541.4   394     383.6   164.1
84.7    315.9   129.5   221.1   130.1
88.7    267.4   161.9   171.5   117.7
98.9    300.7   205.1   176     120.8
111.9   374.9   259     198.6   123.9
122.9   477.7   286     261.7   128
131.9   598.5   313     297.8   155.9
134.2   504.3   296.8   239.2   164.1
131.6   458.6   237.5   225.6   151.8
132.2   622.3   323.8   284.3   179.6
139.8   863     421     343     199.2
142     979     468.3   370.8   201.2
140.5   1043.5  452.5   389.3   208
153.1   1134.3  457.8   412.5   224.5
159.2   1128.9  484.1   394     220.6
162.3   1297.3  542     444.9   220.6
159.1   1249.2  568.3   426.4   214.8
155.1   1434    578.8   491.3   242
161.2   1679.1  573.5   546.9   296.4
171.5   1814.7  584.1   560.8   316.8
168.4   2012.7  757.7   584     318.8
180.4   2046.8  770     607.2   379.4
201.6   2170.1  806.9   681.3   397.5
218.7   2383.7  954.3   755.5   449.1
247     2738.8  1056.7  852.8   499.5
253.7   3275.2  1310.6  1024.3  593.7
261.4   3590.6  1540    1140.2  636.3
273.2   4058.8  1744.8  1269.9  715
279.4   4765    1884    1413.6  760.8
;
proc print;
proc gplot;
plot agric*time=1 dif*time=1;
symbol1 c=red i=join v=square;
proc arima;
identify var=agric(1) stationarity=(adf) nlag=18;
estimate q=1;
forecast lead=10 id=time interval=year out=out;
proc print data=out;
proc gplot;
where time>='1jan1955'd;
plot agric*time=2 forecast*time=3 (l95 u95)*time=4/overlay;
symbol2 c=black i=none v=star;
symbol3 c=red i=join v=none;
symbol4 c=green i=join v=none l=3 w=1;
proc autoreg data=na_in;
model agric=t/nlag=2 method=ml dwprob;
output out=p p=a1 pm=a2 lcl=lcl ucl=ucl;
proc gplot data=p;
where time>='1jan1955'd;
plot agric*time=2 a1*time=3 lcl*time=4 ucl*time=4/overlay;
proc autoreg data=na_in;
model agric=dif/LAGDEP=DIF nlag=1 method=ml noint;
output out=p p=b1 pm=b2 lcl=lcl ucl=ucl;
proc gplot data=p;
where time>='1jan1955'd;
plot agric*time=2 b1*time=3 lcl*time=4 ucl*time=4/overlay;
run;

data a;
input year prop;
cards;
1950	83.5
1951	63.1
1952	71
1953	76.3
1954	70.5
1955	80.5
1956	73.6
1957	75.2
1958	69.1
1959	71.4
1960	73.6
1961	78.8
1962	84.4
1963	84.1
1964	83.3
1965	83.1
1966	81.6
1967	81.4
1968	84
1969	82.9
1970	83.5
1971	83.2
1972	82.2
1973	83.2
1974	83.5
1975	83.8
1976	84.5
1977	84.8
1978	83.9
1979	83.9
1980	81
1981	82.2
1982	82.7
1983	82.3
1984	80.9
1985	80.3
1986	81.3
1987	81.6
1988	83.4
1989	88.2
1990	89.6
1991	90.1
1992	88.2
1993	87
1994	87
1995	88.3
1996	87.8
1997	84.7
1998	80.2
;
proc gplot;
plot prop*year=1;
symbol1 v=diamond i=join c=red;
proc arima data=a;
identify var=prop;
estimate p=1 method=ml;
forecast id=year lead=5 out=out;
proc gplot data=out;
plot prop*year=2 forecast*year=3 l95*year=4 u95*year=4/overlay;
symbol2 v=star i=none c=black ;
symbol3 v=none i=join c=red w=2;
symbol4 v=none i=join c=green l=2 ;
run;

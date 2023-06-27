data a;
input gov_cons@@;
time=intnx('quarter','1jan1981'd,_n_-1);
format time year2.;
t=_n_;
cards;
8444	9215	8879	8990	8115	9457	8590	9294	8997	9574
9051	9724	9120	10143	9746	10074	9578	10817	10116	10779
9901	11266	10686	10961	10121	11333	10677	11325	10698	11624
11052	11393	10609	12077	11376	11777	11225	12231	11884	12109
;
proc gplot;
plot gov_cons*time=1;
symbol1 c=black v=star i=join;
proc reg;
model gov_cons=t;
output out=out p=gov_cons_cup;
proc gplot data=out;
plot gov_cons*time=1 gov_cons_cup*time=2/overlay haxis='1jan1981'd to '1jan1991'd by year;
symbol2 c=red v=none i=join w=2 l=3;
run;

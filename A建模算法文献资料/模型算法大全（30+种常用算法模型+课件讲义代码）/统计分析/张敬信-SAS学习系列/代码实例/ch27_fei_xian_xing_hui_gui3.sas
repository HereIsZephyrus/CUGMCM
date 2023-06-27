data expd;
input x y @@;
datalines;
020 0.57 030 0.72 040 0.81 050 0.87 060 0.91 070 0.94
080 0.95 090 0.97 100 0.98 110 0.99 120 1.00 130 0.99
140 0.99 150 1.00 160 1.00 170 0.99 180 1.00 190 1.00
200 0.99 210 1.00
;
proc nlin data = expd best = 10 method = gauss;
parms b0=0 to 2 by 0.5 b1=0.01 to 0.09 by 0.01;
model y=b0*(1-exp(-b1*x));
der.b0=1-exp(-b1*x);
der.b1=b0*x*exp(-b1*x);
output out = expout p = ygs;
run;
goptions reset = global gunit = pct cback = white border
         htitle = 6 htext = 3 ftext = swissb colors = (back);
proc gplot data = expout;
plot y*x ygs*x /haxis=axis1 vaxis=axis2 overlay;
symbol1 i=none v=plus cv=red h=2.5 w=2;
symbol2 i=join v=none l=1 h=2.5 w=2;
axis1 order=20 to 210 by 10;
axis2 order=0.5 to 1.1 by 0.05;
title1 'y=b0*(1-exp(-b1*x)';
title2 'proc nlin method=gauss';
run;

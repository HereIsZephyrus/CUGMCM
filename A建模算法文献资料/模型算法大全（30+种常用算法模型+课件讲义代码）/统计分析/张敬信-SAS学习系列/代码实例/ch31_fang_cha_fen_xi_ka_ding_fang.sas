data pulse;
do date=1 to 5;
  do person=1 to 5;
  input cloth $ y @@;
  output;
  end;
end;
datalines;
A 129.8  B 116.2  C 114.8  D 104.0  E 100.6
B 144.4  C 119.2  D 113.2  E 132.8  A 115.2
C 143.0  D 118.0  E 115.8  A 123.0  B 103.8
D 133.4  E 110.8  A 114.0  B  98.0  C 110.6
E 142.8  A 110.6  B 105.8  C 120.0  D 109.8
;
run;
proc print data = pulse;
title 'Pulse for Different Protective Suit';
run;
proc anova data = pulse;
class date person cloth;
model y = date person cloth;
run;

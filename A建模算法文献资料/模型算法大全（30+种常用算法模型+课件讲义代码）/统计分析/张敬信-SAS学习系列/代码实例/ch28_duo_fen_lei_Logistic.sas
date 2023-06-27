data school;
length Program $ 9;
input School Program $ Style $ Count @@;
datalines;
1 regular self 10 1 regular team 17 1 regular class 26
1 afternoon self 5 1 afternoon team 12 1 afternoon class 50
2 regular self 21 2 regular team 17 2 regular class 26
2 afternoon self 16 2 afternoon team 12 2 afternoon class 36
3 regular self 15 3 regular team 15 3 regular class 16
3 afternoon self 12 3 afternoon team 12 3 afternoon class 20
;
ods graphics on;
proc logistic data=school;
freq Count;
class School Program(ref=first);
model Style(order=data)=School Program School*Program / link=glogit;
oddsratio program;
run;
ods graphics off;

data fatness;
do i=1 to 3;
  Input food $ ;
  do train=1 to 5;
    do j=1 to 6;
      input y @@;
      output;
    end;
  end;
end;
datalines;
a
22.1 24.1 19.1 22.1 25.1 18.1 
27.1 15.1 20.6 28.6 15.1 24.6 
22.3 25.8 22.8 28.3 21.3 18.3
19.8 28.3 26.8 27.3 26.8 26.8
20.0 17.0 24.0 22.5 28.0 22.5
b
13.5 14.5 11.5  6.0 27.0 18.0
16.9 17.4 10.4 19.4 11.9 15.4
15.7 10.2 16.7 19.7 18.2 12.2
15.1  6.5 17.1  7.6 13.6 21.1
21.8 22.8 18.8 21.3 16.3 14.3
c
19.0 22.0 20.0 14.5 19.0 16.0 
20.0 22.0 25.5 16.5 18.0 17.5
16.4 14.4 21.4 19.9 10.4 21.4
24.5 16.0 11.0  7.5 14.5 15.5
11.8 14.3 21.3  6.3  7.8 13.8
;
run;
proc print data = fatness;
title 'Weight-loss Programs Based on Food and Train';
run;
proc glm data = fatness;
class food train;
model y = food train food*train;
lsmeans food train food*train;
lsmeans food*train / SLICE = food SLICE = train;
Contrast 't1 vs t4 in f1' train 1 0 0 -1 0 food*train 1 0 0 -1 0;
Contrast 't2 vs t4 in f1' train 0 1 0 -1 0 food*train 0 1 0 -1 0;
Contrast 't3 vs t4 in f1' train 0 0 1 -1 0 food*train 0 0 1 -1 0;
Contrast 't4 vs t5 in f1' train 0 0 0 1 -1 food*train 0 0 0 1 -1;
Contrast 't2 vs t5 in f3' train 0 1 0 0 -1 food*train 0 0 0 0 0   0 0 0 0 0  0 1 0 0 -1 ;
run;

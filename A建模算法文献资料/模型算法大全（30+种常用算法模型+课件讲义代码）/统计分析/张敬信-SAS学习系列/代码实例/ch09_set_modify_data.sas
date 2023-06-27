data averagetrain;
set 'D:\ÎÒµÄÎÄµµ\My SAS Files\9.3\trains';
PeoplePerCar = People / Cars;
run;
proc print data = averagetrain;
title 'Average Number of People per Train Car';
format Time TIME5.;
run;

data tmp;
  set SASHELP.workers(firstobs=10 obs=15);
  where ELECTRIC > 260;
run;
proc print data = tmp;
title 'WHERE Statement';
run;

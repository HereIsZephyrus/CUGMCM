data tmp;
  set SASHELP.workers(firstobs=10 obs=15);
  if ELECTRIC > 260;
run;
proc print data = tmp;
title 'IF Statement';
run;

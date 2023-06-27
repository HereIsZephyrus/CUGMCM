proc print data=sasuser.admit noobs;
run;
proc print data=sasuser.admit;
var Age Height Weight Fee;
id ID Name;
run;

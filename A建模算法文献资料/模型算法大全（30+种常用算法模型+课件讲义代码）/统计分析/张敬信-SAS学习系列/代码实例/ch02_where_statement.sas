proc print data=sasuser.admit;
var Age Height Weight Fee;
where Age>30 and Height>65;
run;

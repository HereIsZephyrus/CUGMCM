proc sort data=Sasuser.admit out=work.wgtadmit;
by descending weight age;
run;
proc print data=work.wgtadmit;
var weight age height fee;
where age>30;
run;

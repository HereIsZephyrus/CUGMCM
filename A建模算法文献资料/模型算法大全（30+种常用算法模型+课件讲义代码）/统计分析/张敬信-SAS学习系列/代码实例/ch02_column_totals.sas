proc print data=Sasuser.insure;
var Name Policy Balancedue;
where Pctinsured < 80;
sum Balancedue;
run;

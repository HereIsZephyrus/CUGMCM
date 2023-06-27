title1 'Heart Rates for Patients with';
title3 'Increased Stress Tolerance Levels';
footnote1 'Data from Treadmill Tests';
footnote3 '1st Quarter Admissions';
proc print data=Sasuser.stress;
var resthr maxhr rechr;
where tolerance='I';
run;

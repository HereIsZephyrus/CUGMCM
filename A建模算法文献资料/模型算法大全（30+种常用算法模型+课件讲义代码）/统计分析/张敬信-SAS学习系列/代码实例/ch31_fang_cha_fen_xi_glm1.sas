data veneer;
input brand $ wear @@;
datalines;
ACME  2.3 ACME  2.1 ACME  2.4 ACME  2.5
CHAMP 2.2 CHAMP 2.3 CHAMP 2.4 CHAMP 2.6
AJAX  2.2 AJAX  2.0 AJAX  1.9 AJAX  2.1
TUFFY 2.4 TUFFY 2.7 TUFFY 2.6 TUFFY 2.7
XTRA  2.3 XTRA  2.5 XTRA  2.3 XTRA  2.4
;
run;
proc glm data = veneer;
class brand;
model wear=brand;
means brand /CLM;
contrast 'US vs NON-U.S.' brand 2 2 2 -3 -3;
estimate 'US vs NON-U.S.' brand 2 2 2 -3 -3;
title 'Wear Tests for  five brands';
run;

data Passing;
   array Pass[5] _TEMPORARY_ (65 70 65 80 75);
   array Score[5];
   input ID $ Score[*];
   Pass_Num = 0;
   do i=1 to 5;
      if Score[i] >= Pass[i] then Pass_Num + 1;
   end;
   drop i;
datalines;
001 64 69 68 82 74
002 80 80 80 60 80
;
proc print data = Passing;
   title "Passing Data Set";
   id ID;
   var PASS_NUM SCORE1-SCORE5;
run;

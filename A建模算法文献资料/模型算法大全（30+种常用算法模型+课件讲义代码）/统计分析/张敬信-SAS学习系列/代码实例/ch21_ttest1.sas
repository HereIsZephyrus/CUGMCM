data Swim;
infile 'c:\MyRawData\Olympic50mSwim.dat';
input Swimmer $ FinalTime SemiFinalTime @@;
run;
proc ttest data = Swim PLOTS(ONLY) = (SUMMARYPLOT QQPLOT);
paired SemiFinalTime * FinalTime;
title '50m Freestyle Semifinal vs. Final Results';
run;

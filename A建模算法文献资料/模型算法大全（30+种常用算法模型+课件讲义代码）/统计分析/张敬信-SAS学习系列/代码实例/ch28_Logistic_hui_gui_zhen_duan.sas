data uti2;  
input diagnosis : $13. treatment $ response trials;  
datalines;  
complicated A 78 106  
complicated B 101 112  
complicated C 68 114  
uncomplicated A 40 45  
uncomplicated B 54 59  
uncomplicated C 34 40  
;  
*INFLUENCE’Ô∂œ;  
proc logistic data=uti2;  
class diagnosis treatment / param=ref;  
model response/trials = diagnosis treatment / influence;  
run;  
proc logistic data=uti2;  
class diagnosis treatment / param=ref;  
model response/trials = diagnosis / scale=none aggregate=(treatment diagnosis) influence iplots;  
run;  

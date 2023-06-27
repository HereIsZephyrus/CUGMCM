goptions vsize=7cm hsize=10cm;
data example5_2;
input x@@;
lagx=lag(x);   
t=_n_;
cards;
3.03 	8.46 	10.22 	9.80 	11.96 	2.83 
8.43 	13.77 	16.18 	16.84 	19.57 	13.26 
14.78 	24.48 	28.16 	28.27 	32.62 	18.44 
25.25 	38.36 	43.70 	44.46 	50.66 	33.01 
39.97 	60.17 	68.12 	68.84 	78.15 	49.84 
62.23 	91.49 	103.20 	104.53 	118.18 	77.88 
94.75 	138.36 	155.68 	157.46 	177.69 	117.15 
;
proc gplot data=example5_2;
plot x*t=1;
symbol1 c=black i=join v=star;
proc autoreg data=example5_2;
model x=t/ dwprob ;
proc autoreg data=example5_2;                                                                                                              
model x=t/nlag=5 backstep method=ml noint ;                                                                                             
output out=out p=xp pm=trend;                                                                                                           
proc gplot data=out;                                                                                                                    
plot x*t=2 xp*t=3 trend*t=4 / overlay ;                                                                                                 
symbol2  v=star i=none c=black;                                                                                                        
symbol3  v=none i=join c=red w=2;                                                                                                   
symbol4  v=none i=join c=green w=2;                                                                                                     
proc autoreg data=example5_2;                                                                                                              
model x=lagx/lagdep=lagx;  
model x=lagx/lagdep=lagx noint; 
output out=out p=xp;                                                                                                           
proc gplot data=out;                                                                                                                    
plot x*t=2 xp*t=3 / overlay ;                                                                                                 
run;


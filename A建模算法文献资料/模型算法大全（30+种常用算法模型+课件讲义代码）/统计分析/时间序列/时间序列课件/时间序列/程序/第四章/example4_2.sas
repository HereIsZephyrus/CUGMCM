 data example4_2;
input x@@;
t=_n_;
cards;
1.85 	7.48 	14.29 	23.02 	37.42 	74.27 	140.72 
265.81 	528.23 	1040.27 	2064.25 	4113.73 	8212.21 	16405.95 
£»
proc nlin;   
model x=a*t+b**t;                                                                                                                       
parameters  a=0.1  b=0.1;                                                                                                                 
der.a=t;                                                                                                                                
der.b=log(b)*b**t;                                                                                                                      
output  predicted=xhat out=result;                                                                                                                                                                                                             
proc gplot data=result;                                                                                                                    
plot x*t=1 xhat*t=2/overlay;                                                                                                            
symbol1 c=black i=none v=star;                                                                                                          
symbol2 c=red i=join v=none;                                                                                                            
run;  


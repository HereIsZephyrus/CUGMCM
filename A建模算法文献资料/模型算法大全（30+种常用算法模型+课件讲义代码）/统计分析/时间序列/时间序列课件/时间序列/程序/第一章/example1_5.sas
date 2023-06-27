data example1_5;
input price ; 
time=intnx('month','01jan2005'd,_n_-1);
format time date.;
cards;
3.41                                                                                                                      
3.45                                                                                                                      
.                                                                                                                     
3.53                                                                                                                      
3.45                                                                                                                      
;  
proc expand data= example1_5 out= example1_6;
id time;                                                                                                                                     
proc print data= example1_5;
proc print data= example1_6;                                                                                                                       
run;




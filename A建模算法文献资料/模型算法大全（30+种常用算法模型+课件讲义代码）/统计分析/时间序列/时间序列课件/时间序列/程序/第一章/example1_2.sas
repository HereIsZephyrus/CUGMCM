data example1_2;
input price ; 
time=intnx('month','01jan2005'd,_n_-1);
format time monyy.;
cards;
3.41                                                                                                                      
3.45                                                                                                                      
3.42                                                                                                                      
3.53                                                                                                                      
3.45                                                                                                                      
;                                                                                                                                       
proc print data= example1_2 ;                                                                                                                     
run;

data example1_4;                                                                                                             
set example1_3;    
keep time logprice;                                                                                                                              
where time>='01mar2005'd;                                                                                                    
proc print data= example1_4;                                                                                                                      
run;



data  example1_1;                                                                                                                         
input  time  monyy7.  price;                                                                                                            
format  time  monyy5.;                                                                                                                  
cards;                                                                                                                                  
Jan2005      101                                                                                                                        
Feb2005      82                                                                                                                         
Mar2005      66                                                                                                                         
Apr2005      35                                                                                                                         
May2005      31                                                                                                                         
Jun2005      7                                                                                                                          
;                                                                                                                                       
Run;
proc  print  data=example1_1;                                                                                                             
Run;  

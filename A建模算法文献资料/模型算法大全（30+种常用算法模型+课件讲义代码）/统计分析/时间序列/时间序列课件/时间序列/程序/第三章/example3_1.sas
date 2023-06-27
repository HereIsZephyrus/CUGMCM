data example3_1;                                                                                                                           
input x@@;                                                                                                                              
time=_n_;                                                                                                                               
cards;                                                                                                                                  
0.30	-0.45	0.36	0.00	0.17	0.45	2.15
4.42	3.48	2.99	1.74	2.40	0.11	0.96
0.21	-0.10	-1.27	-1.45	-1.19	-1.47	-1.34
-1.02	-0.27	0.14	-0.07	0.10	-0.15	-0.36
-0.50	-1.93	-1.49	-2.35	-2.18	-0.39	-0.52
-2.24	-3.46	-3.97	-4.60	-3.09	-2.19	-1.21
0.78	0.88	2.07	1.44	1.50	0.29	-0.36
-0.97	-0.30	-0.28	0.80	0.91	1.95	1.77
1.80	0.56	-0.11	0.10	-0.56	-1.34	-2.47
0.07	-0.69	-1.96	0.04	1.59	0.20	0.39
1.06	-0.39	-0.16	2.07	1.35	1.46	1.50
0.94	-0.08	-0.66	-0.21	-0.77	-0.52	0.05
£» 
proc gplot data=example3_1;
plot x*time=1;
symbol1 c=red I=join v=star;   
proc arima data= example3_1;                                                                                                                             
identify var=x nlag=8;   
estimate q=4;
forecast lead=5 id=time out=results;
proc gplot data=results;                                                                                                                
plot x*time=1 forecast*time=2 l95*time=3 u95*time=3/overlay;                                                                            
symbol1 c=black i=none v=star;                                                                                                          
symbol2 c=red i=join v=none;                                                                                                            
symbol3 c=green i=join v=none l=2;                                                                                                          
run;

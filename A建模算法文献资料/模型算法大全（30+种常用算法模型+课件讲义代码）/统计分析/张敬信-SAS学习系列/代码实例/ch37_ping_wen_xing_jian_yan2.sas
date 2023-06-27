data simulation;     
do i=1 to 100;          
x=rannor(1234);          
output;    
end;
run;
data timeseries;      
set simulation;     
x_1st_lag= lag1(x);      
x_1st_diff= dif1(x);     
x_1st_diff_1st_lag= dif1(lag1(x));      
x_1st_diff_2nd_lag= dif1(lag2(x));     
x_1st_diff_3rd_lag= dif1(lag3(x));      
x_1st_diff_4th_lag= dif1(lag4(x));     
x_1st_diff_5th_lag= dif1(lag5(x));
run;
proc reg data=timeseries;      
model x_1st_diff= x_1st_lag                                    
x_1st_diff_1st_lag                                    
x_1st_diff_2nd_lag                                    
x_1st_diff_3rd_lag                                    
x_1st_diff_4th_lag                                    
x_1st_diff_5th_lag;
run;


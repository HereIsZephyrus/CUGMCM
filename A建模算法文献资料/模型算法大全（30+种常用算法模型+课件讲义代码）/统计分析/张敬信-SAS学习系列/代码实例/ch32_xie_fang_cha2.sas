data growth;
do trt=1 to 5;
do rep=1 to 4;
input x y @@;
output;
   end;
end;
cards;
27.2 32.6  32.0 36.6  33.0 37.7  26.8 31.0
28.6 33.8  26.8 31.7  26.5 30.7  26.8 30.4
28.6 35.2  22.4 29.1  23.2 28.9  24.4 30.2
29.3 35.0  21.8 27.0  30.3 36.4  24.3 30.5
20.4 24.6  19.6 23.4  25.1 30.3  18.1 21.8
;
proc anova data=growth;
class trt;
model y=trt;
proc glm data=growth;
class trt;
model y=trt x /solution;
means trt;
lsmeans trt /stderr tdiff;
contrast 'trt12 vs trt34' trt -1 -1 1 1 0;
estimate 'trt1 adj mean' intercept 1 trt 1 0 0 0 0 x 25.76;
estimate 'trt2 adj mean' intercept 1 trt 0 1 0 0 0 x 25.76;
estimate 'adj  trt diff' trt 1 -1 0 0 0;
estimate 'trt1 unadj mean' intercept 1 trt 1 0 0 0 0 x 29.75;
estimate 'trt2 unadj mean' intercept 1 trt 0 1 0 0 0 x 27.175;
estimate 'unadj  trt diff' trt 1 -1 0 0 0 x 2.575;
run;

function [x,v]=examplefun3(x)
v=0.5-((sin(sqrt(x(1)^2+x(2)^2)))^2-0.5)/(1+0.001*(x(1)^2+x(2)^2))^2;
function y=fun1(x);   %x为行向量 
c1=[2 3 1]'; c2=[3 1 0]'; 
y=x*c1+x.^2*c2; y=-y; 
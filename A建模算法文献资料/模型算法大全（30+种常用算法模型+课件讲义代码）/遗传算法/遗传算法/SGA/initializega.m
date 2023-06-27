function [pop] = initializega(num, bounds, evalFN,precision)
%Binary GA
estr=['x=b2f(pop(i,:),bounds,bits);[x v]=' evalFN ...
	'(x); pop(i,:)=[f2b(x,bounds,bits) v];'];  
numVars=size(bounds,1);%Number of variables
bits=calcbits(bounds,precision);
xZomeLength=sum(bits)+1;%Length of string is numVar + fit
pop=round(rand(num,sum(bits)+1));
pop1=pop;
for i=1:num
  eval(estr);
end

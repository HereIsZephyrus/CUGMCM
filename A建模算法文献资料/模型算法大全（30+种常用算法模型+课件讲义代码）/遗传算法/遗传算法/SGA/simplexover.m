function [c1,c2] = simplexover(p1,p2,bounds,evalFN,precision)
% Simple crossover takes two parents P1,P2 and performs simple single point
% crossover.  
%
% function [c1,c2] = simpleXover(p1,p2,bounds,Ops)
% p1      - the first parent ( [solution string function value] )
% p2      - the second parent ( [solution string function value] )
% bounds  - the bounds matrix for the solution space
% Ops     - Options matrix for simple crossover [gen #SimpXovers].
numVar = size(p1,2)-1; 			% Get the number of variables 
% Pick a cut point randomly from 1-number of vars
bits=calcbits(bounds,precision);
cPoint = round(rand * (numVar-2)) + 1;

c1 = [p1(1:cPoint) p2(cPoint+1:numVar+1)]; % Create the children
c2 = [p2(1:cPoint) p1(cPoint+1:numVar+1)];

estr1=['x=b2f(c1,bounds,bits);[x v]=' evalFN ...
	'(x); c1=[f2b(x,bounds,bits) v];']; 

estr2=['x=b2f(c2,bounds,bits);[x v]=' evalFN ...
	'(x); c2=[f2b(x,bounds,bits) v];']; 
eval(estr1);
eval(estr2);
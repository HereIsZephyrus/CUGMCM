function[newPop] = roulette(oldPop,options)
% roulette is the traditional selection function with the probability of
% surviving equal to the fitness of i / sum of the fitness of all individuals
%
% function[newPop] = roulette(oldPop,options)
% newPop  - the new population selected from the oldPop
% oldPop  - the current population
% options - options [gen]

% Binary and Real-Valued Simulation Evolution for Matlab 
% Copyright (C) 1996 C.R. Houck, J.A. Joines, M.G. Kay 
%
% C.R. Houck, J.Joines, and M.Kay. A genetic algorithm for function
% optimization: A Matlab implementation. ACM Transactions on Mathmatical
% Software, Submitted 1996.
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 1, or (at your option)
% any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details. A copy of the GNU 
% General Public License can be obtained from the 
% Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

% Get the parameters of the population
numVars = size(oldPop,2);
numSols = size(oldPop,1);

% Generate the relative probabilities of selection
totalFit = sum(oldPop(:,numVars));
prob=oldPop(:,numVars) / totalFit; 
prob=cumsum(prob);

rNums=sort(rand(numSols,1)) 		% Generate random numbers

% Select individuals from the oldPop to the new
fitIn=1;newIn=1;
while newIn<=numSols
  if(rNums(newIn)<prob(fitIn))
    newPop(newIn,:) = oldPop(fitIn,:);
    newIn = newIn+1;
  else
    fitIn = fitIn + 1;
  end
end
end
function newpop=rouletteselect(oldpop)
%roulette is the traditional selection function with the probability of
%surviving equal to the fittness of i / sum of the fittness of all
%individuals
%function[newPop] = roulette(oldPop,options)
%newPop  - the new population selected from the oldPop
%oldPop  - the current population


%Get the parameters of the population
numVars = size(oldpop,2);
numSols = size(oldpop,1);

%Generate the relative probabilites of selection
totalFit = sum(oldpop(:,numVars));
prob=oldpop(:,numVars) / totalFit; 
prob=cumsum(prob);

rNums=sort(rand(numSols,1)); 		%Generate random numbers

%Select individuals from the oldPop to the new
fitIn=1;newIn=1;
while newIn<=numSols
  if(rNums(newIn)<prob(fitIn))
    newpop(newIn,:) = oldpop(fitIn,:);
    newIn = newIn+1;
  else
    fitIn = fitIn + 1;
  end
end
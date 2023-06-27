
% This script shows how to use the ga using a float representation. 
% You should see the demos for
% more information as well. gademo1, gademo2, gademo3
global bounds

% Setting the seed back to the beginning for comparison sake
rand('seed',0)

% Crossover Operators
xFns = 'simpleXover';
xOpts = [.4];

% Mutation Operators
mFns = 'binaryMutation';

mOpts = [0.005];

% Termination Operators
termFns = 'maxGenTerm';
termOps = [200]; % 200 Generations

% Selection Function
selectFn = 'roulette'
selectOps = [];

% Evaluation Function
evalFn = 'gaMichEval';
evalOps = [];

type gaMichEval

% Bounds on the variables
bounds = [-3 12.1; 4.1 5.8];

% GA Options [epsilon float/binar display]
gaOpts=[1e-6 0 1];

% Generate an intialize population of size 20
startPop = initialize(20,bounds,'gaMichEval',[],[1e-6 0]);

% Lets run the GA
pause

[x endPop bestPop trace]=ga(bounds,evalFn,evalOps,startPop,gaOpts,...
    termFns,termOps,selectFn,selectOps,xFns,xOpts,mFns,mOpts);

pause

% x is the best solution found
x
pause

% endPop is the ending population
endPop
pause

% trace is a trace of the best value and average value of generations
trace
pause

% Plot the best over time
clg
plot(trace(:,1),trace(:,2));
pause

% Add the average to the graph
hold on
plot(trace(:,1),trace(:,3));
pause

% Lets increase the population size by running the defaults
% 
termOps=[100];
[x endPop bestPop trace]=ga(bounds,evalFn,evalOps,[],gaOpts,termFns,termOps,...
    selectFn,selectOps);

% x is the best solution found
x
pause

% endPop is the ending population
endPop
pause

% trace is a trace of the best value and average value of generations
trace
pause

% Plot the best over time
clg
plot(trace(:,1),trace(:,2));
pause

% Add the average to the graph
hold on
plot(trace(:,1),trace(:,3));
pause

%RunExp >> Automation function
% Usage     : RunExp(noRuns, ExitAction) %e.g. RunExp(25, 1); -> Runs each experminet for 25 trials and Exits matlab when doen.
% Arguments : (optional) noRuns     -> Integer -> Number of trials per experiment
%             (optional) ExitAction -> Integer -> Action to perform on completion of experiments
%                                       NOTE: Argument noRuns is required if ExitAction is to be specified.
%                                       Accepted values and their meaning.
%                                       0 = Do Nothing
%                                       1 = Exit Matlab
%                                       2 = Exit Matlab and Shutdown (Windows XP only)
%                                       3 = Exit Matlab and Logoff   (Windows XP only)
%                                       4 = Exit Matlab and Shutdown (Win98 and Me)
%                                       5 = Exit Matlab and Logoff (Win98 and Me)
%
% This function is useful to automate the generation of experimental data.
%
% The default function would conduct the same experiments that were conducted by Ebenhart and Kennedy in their 
% paper - Empirical Study of Particle Swarm Optimization (1999 IEEE 0-708-5536-9/99).
% You may want to change the values of parameters and the names of the functions etc. to suit u'r research
%
% The script stores the values of objective values and history for all the functions in text files for anlysis.
% The name of the function, swarm size and # of dimensions is used to name these files.
% Files starting with an f_ contain the fitness values of the trials while those that begin with an h_ contain the
% history for each trial.
%
% Set the variable numberofRuns to the number of trials needed per experiment.
%
% History        :   Author      :   JAG (Jagatpreet Singh)
%                    Created on  :   07102003 (Thursday. 10th July, 2003)
%                    Comments    :   Arghhhhh! Why don't the results match.
%                    Modified on :   07142003 (Monday. 14th July, 2003)
%                    Comments    :   Converted script into a function. Added code to automatically exit, 
%                                    shutdown or logoff the computer.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hmm.. I ran the simulations (enter RunExp to try u'rself), but ..er. the results don't match Ebenhart and Kennedy's quoted results.
% So here's somethin for u to work on.>> Answer the following : 
%
% Q|What went wrong? ???
%   Your choices are -
%       a)The code of this toolbox. (if yes, plz point out the location and correction) 
%       b)The random number genrator on my computer
%       c)There was some typo in the paper (try changing values of c1, c2 and w.)
%       d)Er..Code used by Ebenhart and Kennedy in their experiments!
%       e)None/All of the above
% E-mail your answers/comments/analysis to jagatpreet@users.sourceforge.net.
% The one who convinces me with his/her answer would be featured on the psotoolbox website along with the answer. :-) 
% So. Get u'r analytical hats on.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function RunExp(noRuns, ExitAction)
numberofRuns = 50;          %number of trials per experiment
if nargin >= 1
    numberofRuns = noRuns;
    if nargin < 2
        ExitAction = 0; 
    end
end
        
psoOptions = get_psoOptions;

% psoOptions.Vars.ErrGoal = 1e-200

% Parameters common across all functions
psoOptions.SParams.c1 = 2;
psoOptions.SParams.c2 = 2;
psoOptions.SParams.w_start = 0.9;
psoOptions.SParams.w_end = 0.4;
psoOptions.SParams.w_varyfor = 1;

psoOptions.Flags.ShowViz = 0;
psoOptions.Flags.Neighbor = 0;
psoOptions.Save.Interval = 0;
psoOptions.Disp.Interval = 0;


% Run experiments for the three complex functions
psoOptions.Obj.f2eval = 'Rastrigrin';
psoOptions.Obj.lb = 2.56;
psoOptions.Obj.ub = 5.12;
psoOptions.SParams.Vmax = 10;
GenExpData(numberofRuns, psoOptions);

psoOptions.Obj.f2eval = 'Griewank';
psoOptions.Obj.lb = 300;
psoOptions.Obj.ub = 600;
psoOptions.SParams.Vmax = 600;
GenExpData(numberofRuns, psoOptions);

psoOptions.Obj.f2eval = 'Rosenbrock';
psoOptions.Obj.lb = 15;
psoOptions.Obj.ub = 30;
psoOptions.SParams.Vmax = 100;
GenExpData(numberofRuns, psoOptions);

% MANAGE EXIT ACTIONS
if ExitAction
    exitString = sprintf('\n\n\t EXITING MATLAB in 10 seconds. PLEASE SAVE OPEN FILES');
    logoffStr = sprintf('\n Your COMPUTER WILL LOG OFF IN 30 seconds. PLEASE SAVE DATA');
    shutdownStr = sprintf('\n Your COMPUTER WILL SHUTDOWN IN 30 seconds. PLEASE SAVE DATA');
    
    disp( exitString );
    errordlg(exitString)
    pause(5);
    if ExitAction == 1  %Just Exit Matlab
        pause(5);
        exit;
    elseif ExitAction == 2  %Exit and Shutdown WinXP.
        disp(shutdownStr);
        errordlg(shutdownStr);
        dos('shutdown -s -f -t 30 -c "MATLAB:RunExp: The function has finished and the system will go into a planned shutdown"');
        pause(5);
        exit;
    elseif ExitAction == 3
        disp(logoffStr);
        errordlg(logoffStr);
        dos('shutdown -l -f -t 30 -c "MATLAB:RunExp: The function has finished and the system will go into a planned shutdown"');
        pause(5);
        exit;
    elseif ExitAction == 4
        disp(shutdownStr);
        errordlg(shutdownStr);
        dos('rundll32.exe shell32.dll,SHExitWindowsEx 8');
        pause(5);
        exit;
    elseif ExitAction == 4
        disp(logoffStr);
        errordlg(logoffStr);
        dos('rundll32.exe shell32.dll,SHExitWindowsEx 0');
        pause(5);
        exit;
    end

end
    
    

%-----------------------------------------------------------%
%--Run Experiments for different dimensions and SwarmSizes--%
%-----------------------------------------------------------%
function GenExpData(numberofRuns, psoOptions)
	DimIters = [10, 20,   30; ...   %Dimensions
              1000, 1500, 2000];    %Corresponding iterations
	for x = DimIters;
        psoOptions.Vars.Dim = x(1,:);
        psoOptions.Vars.Iterations = x(2,:);
        for swarmsize = [20. 40. 80]
            psoOptions.Vars.SwarmSize = swarmsize;
            RnS(numberofRuns, psoOptions);
        end
    end
    
%----------------%
%---Run & save---%
%----------------%
function RnS(numberofRuns, psoOptions)

disp(sprintf('This experiment will optimize %s function for %d times.', psoOptions.Obj.f2eval, numberofRuns));
disp(sprintf('Population Size: %d\t\tDimensions: %d.', psoOptions.Vars.SwarmSize, psoOptions.Vars.Dim));
fVal = 0;
History=[];
disp(sprintf('\nRun \t\t Best objVal'));
for i = 1:numberofRuns
    [tfxmin, xmin, Swarm, tHistory] = pso(psoOptions);
    
    fVal(i,:) = tfxmin;
    History(:,i) = tHistory;
    disp(sprintf('%4d \t\t%10f', i, tfxmin));
end
Avg = sum(fVal)/numberofRuns;
disp(sprintf('\nAvg. \t\t%10f\n\n', Avg))

fFile = strcat('f_', psoOptions.Obj.f2eval, '_', int2str(psoOptions.Vars.Dim), 'd', int2str(psoOptions.Vars.SwarmSize), 'p'); %e.g. f_Rastrigrin_10d20p
hFile = strcat('h_', psoOptions.Obj.f2eval, '_', int2str(psoOptions.Vars.Dim), 'd', int2str(psoOptions.Vars.SwarmSize), 'p');
save(fFile, 'fVal', '-ascii');
save(hFile, 'History', '-ascii');

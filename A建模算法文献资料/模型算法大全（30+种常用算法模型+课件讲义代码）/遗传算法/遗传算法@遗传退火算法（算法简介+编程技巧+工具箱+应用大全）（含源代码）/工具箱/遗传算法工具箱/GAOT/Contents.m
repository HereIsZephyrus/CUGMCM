% Genetic Optimization Toolbox
%
% Main interface
% ga.m                   The Genetic Algorithm  
% initialize.m           Initialization function Used by ga.m   
%
% Operators used during simulated evolution
%
% Crossover Operators
% heuristicXover.m       Operator for the Algorithm Used by ga.m 
% arithXover.m           Operator for the Algorithm Used by ga.m 
% simpleXover.m          Operator for the Algorithm Used by ga.m 
%
% Mutation Operators
% binaryMutation.m       Operator for the Algorithm Used by ga.m 
% boundaryMutation.m     Operator for the Algorithm Used by ga.m 
% multiNonUnifMutation.m Operator for the Algorithm Used by ga.m 
% nonUnifMutation.m      Operator for the Algorithm Used by ga.m 
% unifMutation.m         Operator for the Algorithm Used by ga.m
%
% Selection Functions
% normGeomSelect.m       Selection function Used by ga.m
% roulette.m             Selection function Used by ga.m
% tournSelect.m          Selection function Used by ga.m
%
% Termination Functions
% maxGenTerm.m           Termination function Used by ga.m
% optMaxGenTerm.m        Termination function Used by ga.m
%
% Functions used for binary representation
% calcbits.m             Binary precision function used by ga.m
% f2b.m                  Float to Binary conversion used by ga.m
% b2f.m                  Binary to Float conversion used by ga.m
%
% Utility functions
% parse.m                Parse blank separated names used by ga.m
% delta.m                Used by nonUnifMutation.m and mult...m
%
% Demonstrations
% gademo1.m              Introductory demo of GAOT
% gademo2.m              Multi-dimensional demo of GAOT
% gademo3.m              Reference for GAOT
%
% Functions used in Demonstrations
% gademo1eval1.m         Example eval function used by gademo1.m
% coranaEval.m           Calculate Corana functions used by gademo2.m
% coranaMin.m            Calculate negative of Corana used by gademo2.m
% gaEval.m               Calculation of Corana used for testing
% gaGradEval.m           Evaluation Used for Testing      
% gaGradGrad.m           Gradient used for SQP during Testing

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
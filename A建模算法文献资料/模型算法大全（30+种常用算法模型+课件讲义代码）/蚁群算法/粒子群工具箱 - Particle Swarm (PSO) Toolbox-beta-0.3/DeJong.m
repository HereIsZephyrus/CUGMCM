%The DeJong (Sphere) function for use with the psotoolbox
%
% Function Description:
% Equation -> sum ( x(i)^2 )
%      xmin  = [0, 0, 0.....0]  (all zeroes)
%      fxmin = 0                  (zero)
function Dejed = DeJong(Swarm)
[SwarmSize, Dim] = size(Swarm);
Dejed = sum((Swarm .^2)')';
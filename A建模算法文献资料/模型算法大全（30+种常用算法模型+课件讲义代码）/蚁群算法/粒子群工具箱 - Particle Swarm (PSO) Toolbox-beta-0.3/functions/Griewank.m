%The Griewank function for use with the psotoolbox
%
% Function Description:
% Equation -> sum(((x(i).^2) / 4000)')' - prod(cos(x(i) ./ sqrt(i))')' + 1
%      xmin  = [0, 0, 0.....0]  (all zeroes)
%      fxmin = 0                  (zero)
function Gred = Griewank(Swarm);
[SwarmSize, Dim] = size(Swarm);
indices = repmat(1:Dim, SwarmSize, 1);
Gred = sum(((Swarm.^2) / 4000)')' - prod(cos(Swarm ./ sqrt(indices))')' + 1;



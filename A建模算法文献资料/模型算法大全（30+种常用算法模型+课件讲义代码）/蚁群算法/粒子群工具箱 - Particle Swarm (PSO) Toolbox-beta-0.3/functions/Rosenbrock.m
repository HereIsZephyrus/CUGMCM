%The Rosenbrock function for use with the psotoolbox
%
% Function Description:
% Equation -> sum ( 100 * (x(i+1) - x(i)^2)^2 + (1-x(i))^2 )
%      xmin  = [1, 1, 1.....1]  (all ones)
%      fxmin = 0                  (zero)
function Rosened = Rosenbrock(Swarm)
[SwarmSize, Dim] = size(Swarm);
Swarm1 = Swarm(:, 1:(Dim-1));
Swarm2 = Swarm(:, 2:Dim);
if Dim == 2
    Rosened = 100 * (Swarm2 - Swarm1.^2).^2 + (1 - Swarm1).^2;
else     
    Rosened = sum((100 * (Swarm2 - Swarm1.^2).^2 + (1 - Swarm1).^2)')'; 
end   


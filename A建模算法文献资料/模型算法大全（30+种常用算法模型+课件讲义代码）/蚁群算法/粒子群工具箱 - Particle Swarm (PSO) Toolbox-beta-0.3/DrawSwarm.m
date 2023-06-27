%DrawSwarm >> Internal function of psotoolbox.
% Purpose: To draw a visual display of the Swarm.
% 
% You shouldn't need to mess around with this fn. if u don't wanna change the visualization.
% 
% see also: pso.m
%
function DrawSwarm(Swarm, SwarmSize, Generation, Dimensions, GBest, vizAxes)
X = Swarm';
if Dimensions >= 3
    set(vizAxes,'XData',X(1, :),'YData', X(2,:), 'ZData', X(3,:));
elseif Dimensions == 2
    set(vizAxes,'XData',X(1, :),'YData', X(2,:));
end

GenDiv = 100;
xAx = GBest(1);
yAx = GBest(2);
zAx = GBest(2);

zf = 100 * 50/Generation; %zoom factor

if rem(Generation, GenDiv) == 0
    axis([xAx-zf xAx+100 yAx-zf yAx+zf zAx-zf zAx+zf]);
end

title(Generation);
drawnow;

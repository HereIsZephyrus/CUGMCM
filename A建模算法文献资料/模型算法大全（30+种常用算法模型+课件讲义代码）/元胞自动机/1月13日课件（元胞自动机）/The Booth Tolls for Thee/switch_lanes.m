function new = switch_lanes(old)
new = old;
prob = 0.8;
x = rand;
y = rand;
[L,W] = size(new);
for i = (L-1):-1:1
    for j = 2:(W-1)
        if new(i,j) == -2
           if x < prob %chance turn will be made
              if y > 0.5 %will attempt left
                 if new(i, j-1) == 0
                    new(i, j-1) = 1;
                    new(i, j) = 0;
                 elseif new(i, j+1) == 0
                    new(i, j+1) = 1;
                    new(i,j) = 0;
                 elseif new(i,j) == -2
                    new(i,j) = 1;
                 end
              end
              if y <= 0.5 %will attempt right
                 if new(i, j+1) == 0
                    new(i,j+1) = 1;
                    new(i,j) = 0;
                 elseif new(i, j-1) == 0
                    new(i, j-1) = 1;
                    new(i,j) = 0;
                 elseif new(i,j) == -2
                    new(i,j) = 1;
                 end
              end
           end
           if x >= prob
              new(i,j) = 1;
           end
        end
    end
end
function plaza = clear_boundary(plaza)

[a,b] = size(plaza);
for i = 1:b
    if plaza(a,i) > 0
        plaza(a,i) = 0;
    end
end
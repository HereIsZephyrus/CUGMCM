data painters;
infile 'c:\MyRawData\Artists.dat';
input Name $ 1-21 Genre $ 23-40 Origin $ 42;
run;
proc print data = painters;
where Genre = 'Impressionism';
title 'Major Impressionist Painters';
footnote 'F = France N = Netherlands U = US';
run;

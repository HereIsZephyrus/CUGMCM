bounds=[-1,2];popsum=120;
evalFN='examplefun1';
startpop=[];pc=0.75;
pm=0.01;
maxterm=100;
precision=1e-6;
last=1;
[xval,bpop] =SGA(bounds,popsum,evalFN,startpop,pc,pm,maxterm,precision,last);
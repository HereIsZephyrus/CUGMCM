bounds=[-100,100;-100,100];popsum=120;evalFN='examplefun3';startpop=[];pc=0.75;pm=0.01;maxterm=500;precision=1e-10;last=1;
[xval,bpop] =SGA(bounds,popsum,evalFN,startpop,pc,pm,maxterm,precision,last);
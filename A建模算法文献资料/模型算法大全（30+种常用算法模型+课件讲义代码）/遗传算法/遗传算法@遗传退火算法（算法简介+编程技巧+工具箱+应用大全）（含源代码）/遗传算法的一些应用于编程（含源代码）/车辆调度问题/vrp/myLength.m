
%×ÜÂ·¾¶len



function len=myLength(D,p)
[N,NN]=size(D);
%len=D(p(1,N),p(1,1));
 len=0;
for i=1:(N-1)
   len=len+D(p(1,i),p(1,i+1));
end

       total=[0 0];
     volume=8;
     demand=[0 1 2 1 2 1 4 2 2];
   
        x=find(p==1);
  if x<9      
     %len=len+D(p(1,x),p(1,x+1))+D(p(1,N),1)+D(1,p(1,1))+D(p(1,x),1);
     %len=len+D(p(x),p(x+1))+D(p(N),1)+D(1,p(1))+D(p(x),1);
     len=len+D(p(x),p(x+1))+D(p(N),p(x))+D(1,p(1))+D(p(x),1);
  else
      len=len+D(p(1,N),p(1,1))+D(1,p(1,1));
  end
  
   %len=len+D(p(x),p(x+1))+D(p(N),1)+D(1,p(1))+D(p(x),1);
    %len=D(1,p(1,1))+D(p(1,x),1);
    
    for i=1:x
        %len=len+D(p(1,i),p(1,i+1));
        total(1)=demand(p(1,i))+total(1);
    end
    
    %len=len+D(p(1,x),p(1,x+1))+D(p(1,N),1);
    for i=(x+1):N
        total(2)=demand(p(1,i))+total(2);
        %len=len+D(p(1,i),p(1,i+1))+D(1,p(1,1))+D(p(1,x),1);
    end
    
    
    if total(2)>volume | total(1)>volume
       len=len+100;
    end
   
        
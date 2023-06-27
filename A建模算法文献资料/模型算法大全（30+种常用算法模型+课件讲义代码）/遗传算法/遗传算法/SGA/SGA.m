function [xval,bpop,fitsumnum,inline,outline,bestfit,worstfit,avgfit,rate,MA,MEP] =SGA(bounds,popsum,evalFN,startpop,pc,pm,maxterm,precision,last)
if isempty(startpop) %Generate a population at random
  startpop=initializega(popsum,bounds,evalFN,precision);
end
oldpop=startpop;
popnum=size(oldpop,1);
numvar=size(bounds,1);
term=1;
newpop=oldpop;
rate=0;
while term<=maxterm
    newpop=rouletteselect(newpop);
    i=0;
    for k=1:popnum
        if rand<pc
            i=i+1;
            ind(i)=k;
        end
    end
    if rem(length(ind),2)==0
        ind=ind;
    else
        ind=ind(1:length(ind)-1);
    end
    i=1;
    for i=1:2:length(ind)
        [newpop(ind(i),:),newpop(ind(i+1),:)]=simplexover(newpop(ind(i),:),newpop(ind(i+1),:),bounds,evalFN,precision);
    end
    newpop1=newpop;
    newpop1(:,end)=[];
    [m,n]=size(newpop1);
    i=1;
    for i=1:m*n
        if rand<pm
            k=ceil(i/n);
            if rem(i,n)==0
               site=n;
            else
               site=rem(i,n);
            end
            if newpop1(k,site)==0
                newpop1(k,site)=1;
            else
                newpop1(k,site)=0;
            end
            
            bits=calcbits(bounds,precision);
            estr=['x=b2f(newpop1(k,:),bounds,bits);[x v]=' evalFN ...
	'(x); newpop(k,:)=[f2b(x,bounds,bits) v];']; 
            eval(estr);
        end
    end
    inline(term)=sum(newpop(:,end))/popsum;%在线指标
    [bestfits,bestind]=max(newpop(:,end));
    bestpop=newpop(bestind,:);
    outline(term)=bestpop(end);%离线
     bestfit(term)=bestpop(end);%最优解搜索性能
     [worstfits,worstind]=min(newpop(:,end));
     worstpop=newpop(worstind,:);
     worstfit(term)=worstpop(end);%最小适应度
     avgfit=inline;%平均适应度
     if last-bestpop(end)<1e-6
           rate=term;%收敛速度
     end
      %=======多样性========
       cspop=newpop;
       cspop(:,end)=[];
       [N,L]=size(cspop);
       arrange1=sum(cspop,1);arrange2=sum(1-cspop,1);
       arrange=[arrange1;arrange2];
       ymax=max(arrange);ymin=min(arrange);
       ydeta=ymax-ymin;
       ysum=sum(ydeta);
       MA(term)=1-ysum/(L*N);
       pl=arrange1/N;
       MEP(term)=-sum(pl.*log(pl))/L;
       
       %=======over=========
   term=term+1; 
end
 estr=['x=b2f(newpop(xind,:),bounds,bits);[x v]=' evalFN ...
	'(x); ']; 
[xval,xind]=max(newpop(:,end));
eval(estr);

[m,n]=size(newpop);
i=1;
for i=1:m
    estr=['x=b2f(newpop(i,:),bounds,bits);[x,v]=' evalFN ...
             '(x);'];
     eval(estr);
     endpop(i,:)=[x,v];
 end
 bpop=endpop(xind,:);
  fitsumnum=maxterm*popsum;%适应度计算次数
  inline=cumsum(inline)./(1:term-1);%inline在线
  outline=cumsum(outline)./(1:term-1);%outline离线
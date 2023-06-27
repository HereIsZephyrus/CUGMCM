%
%CA driver
%
%forest fire

clf
clear all

n=300;%矩阵大小

Plightning = .000005;%被闪电几种概率
Pgrowth = 0; %空地长出新树的概率
%Pgrowth = 0.001;

z=zeros(n,n);
o=ones(n,n);

veg=z+2;
sum=z;


%imh = image(cat(3,z,veg*.02,z));
imh = image(cat(3,z,o,z));
set(imh, 'erasemode', 'none')
axis equal
axis tight
 
% burning -> empty
% green -> burning if one neigbor burning or with prob=f (lightning)
% empty -> green with prob=p (growth)
% veg = {empty=0 burning=1 green=2}
  set(imh, 'cdata', cat(3,z,o,z) )
  drawnow
  moni=z;
 for j=100:110
    moni(j,j)=1;
 end
for i=1:3000
    %nearby fires?
    
    sum = (veg(1:n,[n 1:n-1])==1) + (veg(1:n,[2:n 1])==1) + ...
           (veg([n 1:n-1], 1:n)==1) + (veg([2:n 1],1:n)==1) ;
 
    veg = ...
         2*(veg==2) - ((veg==2) & (sum>0 |moni))...
         +2*((veg==0) & rand(n,n)<Pgrowth) ;


    set(imh, 'cdata', cat(3,(veg==1),(veg==2),z) )
    drawnow
end



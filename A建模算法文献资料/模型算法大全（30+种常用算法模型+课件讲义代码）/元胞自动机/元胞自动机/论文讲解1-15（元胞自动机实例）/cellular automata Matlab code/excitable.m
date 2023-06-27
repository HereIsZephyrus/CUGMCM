%
%CA driver
%
%excitable media

clf
clear all

n=128;

z=zeros(n,n);
cells=z;

cells = (rand(n,n))<.1 ;
%cells(n/2,n*.25:n*.75) = 1;
%cells(n*.25:n*.75,n/2) = 1;
sum=z;

imh = image(cat(3,cells,z,z));
set(imh, 'erasemode', 'none')
axis equal
axis tight

x = [2:n-1];
y = [2:n-1];

t = 6; % center value=6; 7 makes fast pattern; 5 analiating waves
t1 = 3; % center value=3
for i=1:1200
    
    
    sum(x,y) = ((cells(x,y-1)>0)&(cells(x,y-1)<t)) + ((cells(x,y+1)>0)&(cells(x,y+1)<t)) + ...
        ((cells(x-1, y)>0)&(cells(x-1, y)<t)) + ((cells(x+1,y)>0)&(cells(x+1,y)<t)) + ...
        ((cells(x-1,y-1)>0)&(cells(x-1,y-1)<t)) + ((cells(x-1,y+1)>0)&(cells(x-1,y+1)<t)) + ...
        ((cells(x+1,y-1)>0)&(cells(x+1,y-1)<t)) + ((cells(x+1,y+1)>0)&(cells(x+1,y+1)<t));
       
    cells = ((cells==0) & (sum>=t1)) + ...
            2*(cells==1) + ...
            3*(cells==2) + ...
            4*(cells==3) + ...
            5*(cells==4) + ...
            6*(cells==5) +...
            7*(cells==6) +...
            8*(cells==7) +...
            9*(cells==8) +...
            0*(cells==9);
    
    set(imh, 'cdata', cat(3,z,cells/10,z) )
    drawnow
end



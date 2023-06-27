%x=linspace(-100,100,50);
%y=x;
%[X,Y]=meshgrid(x,y);
%Z=0.5-((sin(sqrt(X.^2+Y.^2))).^2-0.5)./(1+0.001*(X.^2+Y.^2)).^2;

%surf(X,Y,Z)
%grid on
%x=linspace(-5.12,5.12,50);
%y=x;
%[X,Y]=meshgrid(x,y);
%Z=(3./(0.05+(X.^2+Y.^2))).^2+(X.^2+Y.^2).^2;
%surf(X,Y,Z)
x=linspace(-1,2,100);
y=x.*sin(10*pi*x)+2;
plot(x,y)
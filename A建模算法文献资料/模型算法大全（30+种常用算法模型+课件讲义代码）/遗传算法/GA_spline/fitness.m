function [score] = fitness(method)
global voltageX;
global outputY;
global len;                 %样本组容量
codeSize=length(method);     %codeSize=7
sum_A=0;
X=zeros(1,codeSize);
Y=zeros(1,codeSize);
for i=1:len  
    A=0;
    for j=1:codeSize
        X(j)=voltageX(i,method(j));
        Y(j)=outputY(i,method(j));
    end
    Y1=interp1(X,Y,voltageX(i,:),'spline');
    yTable=abs(Y1-outputY(i,:));
    for j=1:51
        dif=yTable(j);
        if dif<=0.5
            A=A+0;
        elseif dif<=1
            A=A+0.5;
        elseif dif<=2
            A=A+1.5;
        elseif dif<=3
            A=A+6;
        elseif dif<=5
            A=A+12;
        elseif dif>5
            A=A+25;
        end
    end
    sum_A=sum_A+A;
end
score=sum_A/len+84;
end


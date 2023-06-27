%.......提供者/daichenglei/........
%.........绘图.picture...........
function draw(xyCity,R,nCity)
scatter(xyCity(:,1),xyCity(:,2),'x')
title('随机城市图位置');
hold on
plot([xyCity(R(1),1),xyCity(nCity,1)],[xyCity(R(1),2),xyCity(nCity,2)])
plot([xyCity(R(nCity-1),1),xyCity(nCity,1)],[xyCity(R(nCity-1),2),xyCity(nCity,2)])
hold on
for i=1:length(R)-1
    x0=xyCity(R(i),1);
    y0=xyCity(R(i),2);
    x1=xyCity(R(i+1),1);
    y1=xyCity(R(i+1),2);
    xx=[x0,x1];
    yy=[y0,y1];
    plot(xx,yy)
    title('最佳路径');
    hold on
end

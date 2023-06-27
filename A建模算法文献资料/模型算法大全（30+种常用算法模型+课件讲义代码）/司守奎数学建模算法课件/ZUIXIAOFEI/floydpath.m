%求最短路径函数
function path=floydpath(w);
global M num
w=w+((w==0)-eye(num))*M;
p=zeros(num);
for k=1:num
for i=1:num
for j=1:num
if w(i,j)>w(i,k)+w(k,j)
w(i,j)=w(i,k)+w(k,j);
p(i,j)=k;
end
end
end
end
if w(1,num) ==M
path=[];
else
path=zeros(num);
s=1;t=num;m=p(s,t);
while ~isempty(m)
if m(1)
s=[s,m(1)];t=[t,t(1)];t(1)=m(1);
m(1)=[];m=[p(s(1),t(1)),m,p(s(end),t(end))];
else
path(s(1),t(1))=1;s(1)=[];m(1)=[];t(1)=[];
end
end
end

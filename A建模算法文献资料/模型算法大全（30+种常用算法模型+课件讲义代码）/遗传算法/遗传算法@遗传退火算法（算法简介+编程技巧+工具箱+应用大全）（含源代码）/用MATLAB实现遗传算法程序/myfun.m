function [f]=myfun(sol,bnd)
%           ���ߣ�����01-2�����º�
%           zxh21st@163.com
x=sol;
n=length(x);
f=0;
for i=1:n
    f=f+x(i)*i;
end
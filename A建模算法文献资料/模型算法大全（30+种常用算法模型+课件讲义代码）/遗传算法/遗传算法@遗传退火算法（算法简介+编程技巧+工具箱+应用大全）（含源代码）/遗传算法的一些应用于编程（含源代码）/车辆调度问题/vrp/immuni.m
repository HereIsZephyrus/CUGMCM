% √‚“ﬂ“≈¥´
function a=immuni(a,b)
m=length(a);
c=zeros(m);

for i=1:m
    c(i)=a(i);  
    c(i+1)=a(b(i,2));
    delete  a(b(i,2));
    c(i+2)=a(i+3);
end

    a=c;

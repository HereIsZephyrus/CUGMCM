%��2������ת��Ϊ10������
function x=n2to10(s);

bn=size(s,2);
x=s(bn);
for i=1:bn-1
   x=x+s(bn-i)*power(2,i);
end
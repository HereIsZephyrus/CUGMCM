%�����족����
function snnew=mut(snew,pm);

bn=size(snew,2);
snnew=snew;

pmm=pro(pm);  %���ݱ�����ʾ����Ƿ���б��������1���ǣ�0���
if pmm==1
   chb=round(rand*(bn-1))+1;  %��[1,bn]��Χ���������һ������λ
   snnew(chb)=abs(snew(chb)-1);
end   
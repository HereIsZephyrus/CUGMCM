%�����桱����
function scro=cro(s,seln,pc);

inn=size(s,1);
bn=size(s,2);

pcc=pro(pc);  %���ݽ�����ʾ����Ƿ���н��������1���ǣ�0���
if pcc==1
   chb=round(rand*(bn-2))+1;  %��[1,bn-1]��Χ���������һ������λ
   scro(1,:)=[s(seln(1),1:chb) s(seln(2),chb+1:bn)];
   scro(2,:)=[s(seln(2),1:chb) s(seln(1),chb+1:bn)];
else
   scro(1,:)=s(seln(1),:);
   scro(2,:)=s(seln(2),:);
end  
%��ѡ�񡱲���
function seln=sel(s,p);

inn=size(p,1);

%����Ⱥ��ѡ����������
for i=1:2
   r=rand;  %����һ�������
   prand=p-r;
   j=1;
   while prand(j)<0
       j=j+1;
   end
   seln(i)=j; %ѡ�и�������
end
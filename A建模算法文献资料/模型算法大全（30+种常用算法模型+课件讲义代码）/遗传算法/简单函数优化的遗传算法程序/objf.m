%������Ӧ�Ⱥ���

function [f,p]=objf(s);

inn=size(s,1);   %��inn������
bn=size(s,2);    %���峤��Ϊbn

for i=1:inn
   x=n2to10(s(i,:));  %��������ת��Ϊʮ����
   xx=-1.0+x*3/(power(2,bn)-1);  %ת��Ϊ[-1,2]�����ʵ��
   f(i)=ft(xx);  %���㺯��ֵ������Ӧ��
end
f=f';

%����ѡ�����
fsum=sum(f.*f);
ps=f.*f/fsum;

%�����ۻ�����
p(1)=ps(1);
for i=2:inn
   p(i)=p(i-1)+ps(i);
end
p=p';
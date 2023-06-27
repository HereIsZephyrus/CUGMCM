%���Ŵ��㷨���м򵥺������Ż�
clear

bn=22; %���崮����
inn=50; %��ʼ��Ⱥ��С
gnmax=200;  %������
pc=0.75; %�������
pm=0.05; %�������

%������ʼ��Ⱥ
s=round(rand(inn,bn));

%������Ӧ��,������Ӧ��f���ۻ�����p
[f,p]=objf(s);  

gn=1;
while gn<gnmax+1
   for j=1:2:inn
      
      %ѡ�����
      seln=sel(s,p);
      
      %�������
      scro=cro(s,seln,pc);
      scnew(j,:)=scro(1,:);
      scnew(j+1,:)=scro(2,:);
      
      %�������
      smnew(j,:)=mut(scnew(j,:),pm);
      smnew(j+1,:)=mut(scnew(j+1,:),pm);
   end
   s=smnew;  %�������µ���Ⱥ
   
   %��������Ⱥ����Ӧ��   
   [f,p]=objf(s);
   
   %��¼��ǰ����ú�ƽ������Ӧ��
   [fmax,nmax]=max(f);
   fmean=mean(f);
   ymax(gn)=fmax;
   ymean(gn)=fmean;
   %��¼��ǰ������Ѹ���
   x=n2to10(s(nmax,:));
   xx=-1.0+x*3/(power(2,bn)-1);
   xmax(gn)=xx;
   
   gn=gn+1
end
gn=gn-1;

%��������
subplot(2,1,1);
plot(1:gn,[ymax;ymean]);
title('������Ӧ�ȱ仯','fonts',10);
legend('�����Ӧ��','ƽ����Ӧ��');
string1=['������Ӧ��',num2str(ymax(gn))];
gtext(string1);
subplot(2,1,2);
plot(1:gn,xmax,'r-');
legend('�Ա���');
string2=['�����Ա���',num2str(xmax(gn))];
gtext(string2);
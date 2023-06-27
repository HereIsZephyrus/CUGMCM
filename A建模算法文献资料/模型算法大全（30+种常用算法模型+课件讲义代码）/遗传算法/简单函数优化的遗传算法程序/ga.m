%���Ŵ��㷨���м򵥺������Ż�,������ʾ�м����
clear

bn=22; %���崮����
inn=50; %��ʼ��Ⱥ��С
gnmax=200;  %������
pc=0.8; %�������
pm=0.05; %�������

%������ʼ��Ⱥ
s=round(rand(inn,bn));

gnf1=5;
gnf2=20;

%������Ӧ��,������Ӧ��f���ۻ�����p
[f,p]=objf(s);  

gn=1;
while gn<gnmax+1
    xp=-1:0.01:2;
    yp=ft(xp);
    for d=1:inn
        xi=n2to10(s(d,:));
        xdi(d)=-1.0+xi*3/(power(2,bn)-1);
    end
    yi=ft(xdi);
    plot(xp,yp,'b-',xdi,yi,'g*');
    strt=['��ǰ���� gn=' num2str(gn)];
    text(-0.75,1,strt);
    text(-0.75,3.5,'*  ��ǰ��Ⱥ','Color','g');
    if gn<gnf1
        pause;
    end
    hold on;
           
    for j=1:2:inn
      %ѡ�����
      seln=sel(s,p);
      xs1=n2to10(s(seln(1),:));
      xds1=-1.0+xs1*3/(power(2,bn)-1);
      ys1=ft(xds1);
      xs2=n2to10(s(seln(2),:));
      xds2=-1.0+xs2*3/(power(2,bn)-1);
      ys2=ft(xds2);
      hold on;
      drawnow;
      plot(xds1,ys1,'r*',xds2,ys2,'r*');
      %�������
      scro=cro(s,seln,pc);
      scnew(j,:)=scro(1,:);
      scnew(j+1,:)=scro(2,:);
      
      %�������
      smnew(j,:)=mut(scnew(j,:),pm);
      smnew(j+1,:)=mut(scnew(j+1,:),pm);
      
  end
  drawnow;
  text(-0.75,3.3,'*  ѡ���','Color','r');
  if gn<gnf1
      pause;
  end
  
  for d=1:inn
      xc=n2to10(scnew(d,:));
      xdc(d)=-1.0+xc*3/(power(2,bn)-1);
  end
  yc=ft(xdc);
  drawnow;
  plot(xdc,yc,'m*');
  text(-0.75,3.1,'*  �����','Color','m');
  if gn<gnf1
      pause;
  end
  hold on;
  
  for d=1:inn
      xm=n2to10(smnew(d,:));
      xdm(d)=-1.0+xm*3/(power(2,bn)-1);
  end
  ym=ft(xdm);
  drawnow;
  plot(xdm,ym,'c*');
  text(-0.75,2.9,'*  �����','Color','c');
  
  if gn<gnf2
      pause;
  end
  hold off;
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
   
   gn=gn+1;
end
gn=gn-1;

figure(2);
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

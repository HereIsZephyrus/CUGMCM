clc,clear 
load sj.txt    %���صз�100 ��Ŀ������ݣ� ���ݰ��ձ���е�λ�ñ����ڴ��ı��ļ� sj.txt �� 
x=sj(:,1:2:8);x=x(:); 
y=sj(:,2:2:8);y=y(:); 
sj=[x y]; d1=[70,40];  
sj=[d1;sj;d1]; sj=sj*pi/180; 
d=zeros(102); %������� d 
for i=1:101 
    for j=i+1:102 
        temp=cos(sj(i,1)-sj(j,1))*cos(sj(i,2))*cos(sj(j,2))+sin(sj(i,2))*sin(sj(j,2)); 
        d(i,j)=6370*acos(temp); 
    end 
end 
d=d+d'; 
S0=[];Sum=inf; 
rand('state',sum(clock)); 
for j=1:1000 
    S=[1 1+randperm(100),102]; 
    temp=0; 
        for i=1:101 
        temp=temp+d(S(i),S(i+1)); 
    end 
    if temp<Sum 
        S0=S;Sum=temp; 
    end 
end 
e=0.1^30;L=20000;at=0.999;T=1; 
%�˻���� 
for k=1:L 
   %�����½� 
c=2+floor(100*rand(1,2)); 
c=sort(c); 
c1=c(1);c2=c(2); 
  %������ۺ���ֵ 
  df=d(S0(c1-1),S0(c2))+d(S0(c1),S0(c2+1))-d(S0(c1-1),S0(c1))-d(S0(c2),S0(c2+1)); 
   %����׼�� 
  if df<0 
  S0=[S0(1:c1-1),S0(c2:-1:c1),S0(c2+1:102)];       
  Sum=Sum+df; 
  elseif exp(-df/T)>rand(1) 
  S0=[S0(1:c1-1),S0(c2:-1:c1),S0(c2+1:102)]; 
  Sum=Sum+df; 
   end 
  T=T*at; 
   if T<e 
       break; 
   end 
end 
 %  ���Ѳ��·����·������ 
S0,Sum
path=IX(IZ(1),:) 
long=DZ(1) 
toc 
xx=sj0(path,1);yy=sj0(path,2); 
plot(xx,yy,'-o') 
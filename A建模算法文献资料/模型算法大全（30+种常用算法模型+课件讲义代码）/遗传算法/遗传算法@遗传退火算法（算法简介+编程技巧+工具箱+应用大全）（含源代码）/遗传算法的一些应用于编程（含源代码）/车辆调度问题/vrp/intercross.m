%�����㷨���ò���ƥ�佻��%�����㷨���ò���ƥ�佻��
function [a,b]=intercross(a,b)
L=length(a);
if L<=10  %ȷ��������
    W=9;
elseif ((L/10)-floor(L/10))>=rand&&L>10
    W=ceil(L/10)+8;
else
    W=floor(L/10)+8;
end
p=unidrnd(L-W+1);%���ѡ�񽻲淶Χ����p��p+W
for i=1:W
    %����
    x=find(a==b(1,p+i-1));
    y=find(b==a(1,p+i-1));
    [a(1,p+i-1),b(1,p+i-1)]=exchange(a(1,p+i-1),b(1,p+i-1));
    [a(1,x),b(1,y)]=exchange(a(1,x),b(1,y));   
end





%function [FARM]=intercross(FARM,D,Pc)
%[s,t]=size(FARM);%n*N
%FARM1=FARM;
%for i=1:2:s
  %  if Pc>rand&&i<=s-1
    %     crosspoint =randperm(t-1);
  %       if crosspoint(2)<crosspoint(1)
   %          p=crosspoint(2);
 %            crosspoint(2)=crosspoint(1);
   %          crosspoint(1)=p;
   %      end
    %     middle=zeros(1,crosspoint(2)-crosspoint(1));
   %      middle=FARM(i,crosspoint(1)+1:crosspoint(2));
   %      FARM(i,crosspoint(1)+1:crosspoint(2))=FARM(i+1,crosspoint(1)+1:crosspoint(2));
  %       FARM(i+1,crosspoint(1)+1:crosspoint(2))=middle;
    %     for j=1:crosspoint(1)
    %          while find(FARM(i,crosspoint(1)+1:crosspoint(2))==FARM(i,j))
     %            zhi=find(FARM(i,crosspoint(1)+1:crosspoint(2))==FARM(i,j));
  %               y=FARM(i+1,crosspoint(1)+zhi);
    %             FARM(i,j)=y;
   %           end
    %     end
  
  %      for j=crosspoint(2)+1:t
  %           while find(FARM(i,crosspoint(1)+1:crosspoint(2))==FARM(i,j))
  %                zhi=find(FARM(i,crosspoint(1)+1:crosspoint(2))==FARM(i,j));
   %               y=FARM(i+1,crosspoint(1)+zhi);
 %                 FARM(i,j)=y;
    %         end
    %    end
       
       % ��������˻�ѡ�񸸴�
       
    %   for i=1:s
    %       if myLength(D,FARM1(i,:))<myLength(D,FARM1(i,:))
           %    FARM(i,:)=FARM1(i,:);
    %       end
   %    end
  %  end
%end

        
        
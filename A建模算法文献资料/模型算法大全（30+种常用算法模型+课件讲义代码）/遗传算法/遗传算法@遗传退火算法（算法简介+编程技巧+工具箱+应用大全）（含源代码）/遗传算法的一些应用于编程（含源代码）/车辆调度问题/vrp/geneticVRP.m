
%D�Ǿ������nΪ��Ⱥ����

%CΪֹͣ�������Ŵ����� C��ʱ����ֹͣ,C�ľ���ȡֵ������Ĺ�ģ�ͺķѵ�ʱ�����
%mΪ��ֵ��̭����ָ��,���ȡΪ1,2,3,4,����̫��
%�������Pc,�������Pm
%RΪ���·��,RlengthΪ·������
      
function [R,Rlength]=geneticVRP(D,demand,n,C,m,Pc,Pm)
         [N,NN]=size(D);%(31*31)
         farm=zeros(n,N);%���ڴ洢��Ⱥ
         for i=1:n
            % flag=0;
             %while flag==0
              %tem=randperm(N); %������ɳ�ʼ��Ⱥ
             %if validate(tem,demand,N)==1
              %  flag=1;
             %end
             %end
             farm(i,:)=randperm(N);
             end
         R=farm(1,:);%һ�������(����)

                           %farm(1,:)=R;
        len=zeros(n,1);%�洢·������
        fitness=zeros(n,1);%�洢����ֵ
        counter=0;
        
       while counter<C
            for i=1:n
                len(i,1)=myLength(D,farm(i,:));%����·������
            end
            %maxlen=max(len);
            minlen=min(len);
           
            %fitness=fit(len,m,maxlen,minlen);%������Ӧ��
            rr=find(len==minlen);%���ص�����len��·����̵�·������(i,1)
            
            R=farm(rr(1,1),:);%�������·��
                                                   %disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
            FARM=farm;%��ʤ��̭��nn��¼�˸��Ƶĸ���
%ѡ��,  
          K=30;
          [aa,bb]=size(FARM);
          FARM2=FARM;
          len2=len;
          [len]=sort(len);
          for i=1:aa
              tt= find(len2==len(i,1));
              FARM(i,:)=FARM2(tt(1,1),:);
          end   
          for i=1:K
              j=aa+1-i;
              FARM(j,:)=FARM(i,:);
              
          end                                 
 %                �������
              [aa,bb]=size(FARM);
               FARM2=FARM;
             
               for i=1:2:aa
                    
                       if Pc>rand&&i<aa %�������Pc
                            A=FARM(i,:);
                            B=FARM(i+1,:);
                            [A,B]=intercross(A,B);
                            FARM(i,:)=A;
                            FARM(i+1,:)=B;
                       end  
                      
               end
              %�������  (��ʡȥ)             
               for i=1:aa
                   if myLength(D,FARM(i,:))>myLength(D,FARM2(i,:))
                       FARM(i,:)=FARM2(i,:);
                   end
               end
               clear FARM2
          
             [aa,bb]=size(FARM); %aa=nn2
   
%       ����   
            FARM2=FARM;
            for i=1:aa
                if Pm>=rand                    
                  FARM(i,:)=mutate(FARM(i,:));
                end
            end
             %�������(��ʡ��)  
               for i=1:aa
                   if myLength(D,FARM(i,:))>myLength(D,FARM2(i,:))
                       FARM(i,:)=FARM2(i,:);
                   end
               end
               clear FARM2
%Ⱥ��ĸ���
           %FARM2=zeros(n-aa+1,N);
           %if n-aa>=1             
           %    for i=1:n-aa
           %       FARM2(i,:)=randperm(N);%�������n-aa��Ⱥ
           %     end
           % end
           FARM=[R;FARM];%�����������n-aa�������Ӻ�����Ⱥ,���ϴε��������Ž��ǰ�������Ⱥ
           [aa,bb]=size(FARM);
                                                   %disp('~~~~~~~~~~~~~~~~4~~~~~~~��֤zong~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
             %������Ⱥ��ģΪn                                         
            if aa>n
                FARM=FARM(1:n,:);
            end   
     
    
                                                    %disp('~~~~~~~~~~~~~~~~~~~5~~~~��֤zong~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
            %����farm
            farm=FARM;
            clear FARM
            %���µ�������
            counter=counter+1 ; 
            
       end
 %������
      
        Rlength=myLength(D,R)    
        
        R
        Rlength=myLength(D,R)%������
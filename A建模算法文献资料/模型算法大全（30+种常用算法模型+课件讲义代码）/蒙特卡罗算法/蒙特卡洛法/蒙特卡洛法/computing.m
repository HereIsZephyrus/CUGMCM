function [num,pass]=computing(tim0)

seat=[0 0 0];%����Ա����
pass=rand(1,4);%��š�����ʱ�䡢����Ҫ��ʱ�䡢������ʱ��
pass(5)=0;%����Ա
pass(6)=0;%�뿪ʱ��
pass(7)=0;%�ȴ�ʱ��
num=1;%��������
tim=0;%ʱ�������
temp=0;%

while tim<=tim0 
    pass(num,1)=num;  %װ�����
    pass(num,2)=rand;
    pass(num,3)=rand;
    pass(num,4)=rand;
    
    %����˿͵���ʱ��
    if pass(num,2)<=0.07
       temp=4;
    else if  pass(num,2)<=0.17
            temp=5;
        else if  pass(num,2)<=0.69
            temp=6;
            else if  pass(num,2)<=0.89
            temp=7;
                else temp=8;
                end
            end
        end
    end
    tim=tim+temp;   %װ��˿͵���ʱ��
    pass(num,2)=tim;
    if pass(num,3)<=0.1 
        pass(num,3)=4;  %װ����Ҫ��������ʱ��
    else pass(num,3)=0;
    end
    num=num+1;
end
num=num-1;

for i=1:num
    
    %����˿͵���ϯλ
    if seat(1)<=pass(i,2)+pass(i,7)
        pass(i,5)=1; %��1�ŷ���Ա��
        temp1=timinge1(1,pass(i,4));
        seat(1)=pass(i,2)+pass(i,3)+temp1;
        pass(i,4)=temp1;  %װ������������ʱ��
    else if seat(2)<=pass(i,2)+pass(i,7)
            pass(i,5)=2;  %��2�ŷ���Ա��
            temp1=timinge1(2,pass(i,4));
            seat(2)=pass(i,2)+pass(i,3)+temp1;
            pass(i,4)=temp1; %װ������������ʱ��
        else if seat(3)<=pass(i,2)+pass(i,7)
                pass(i,5)=3; %��2�ŷ���Ա��
                temp1=timinge1(3,pass(i,4));
                seat(3)=pass(i,2)+pass(i,3)+temp1;
                pass(i,4)=temp1;                
            else               %����ȴ�ʱ��
                x=seat(1);
                y=1; 
                if x>seat(2)
                    x=seat(2);
                    y=2;
                end
                if x>seat(3)
                    x=seat(3);
                    y=3;
                end
                pass(i,5)=y;
                temp1=timinge1(y,pass(i,4));
                pass(i,7)=seat(y)-pass(i,2);
                seat(y)=seat(y)+temp1+pass(i,3);
                pass(i,4)=temp1;
            end
        end
    end
pass(i,6)=pass(i,2)+pass(i,3)+pass(i,4);
end
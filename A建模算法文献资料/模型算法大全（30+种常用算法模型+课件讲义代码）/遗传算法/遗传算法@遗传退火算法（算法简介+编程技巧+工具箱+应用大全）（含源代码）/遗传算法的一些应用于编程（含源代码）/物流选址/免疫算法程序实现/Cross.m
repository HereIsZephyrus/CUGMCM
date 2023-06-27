function ret=Cross(pcross,chrom,sizepop,length)
% �������
% pcorss                input  : �������
% chrom                 input  : ����Ⱥ
% sizepop               input  : ��Ⱥ��ģ
% length                input  : ���峤��
% ret                   output : ����õ��Ŀ���Ⱥ

% ÿһ��forѭ���У����ܻ����һ�ν�����������ѡ��Ⱦɫ���Ǻͽ���λ�ã��Ƿ���н���������ɽ�����ʣ�continue������
for i=1:sizepop  
    
    % ���ѡ������Ⱦɫ����н���
    pick=rand;
    while prod(pick)==0
        pick=rand(1);
    end
    
    if pick>pcross
        continue;
    end
    
    % �ҳ��������
    index(1)=unidrnd(sizepop);
    index(2)=unidrnd(sizepop);
    while index(2)==index(1)
        index(2)=unidrnd(sizepop);
    end
    
    % ѡ�񽻲�λ��
    pos=ceil(length*rand);
    while pos==1
        pos=ceil(length*rand);
    end

    % ���彻��
    chrom1=chrom(index(1),:);
    chrom2=chrom(index(2),:);
    
    k=chrom1(pos:length);
    chrom1(pos:length)=chrom2(pos:length);
    chrom2(pos:length)=k; 
    
    % ����Լ��������������Ⱥ
    flag1=test(chrom(index(1),:));
    flag2=test(chrom(index(2),:));
    
    if flag1*flag2==1
        chrom(index(1),:)=chrom1;
        chrom(index(2),:)=chrom2;
    end
    
end

ret=chrom;
end
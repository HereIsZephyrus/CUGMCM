function ret=Select(individuals,sizepop)
% ���̶�ѡ��
% individuals input  : ��Ⱥ��Ϣ
% sizepop     input  : ��Ⱥ��ģ
% ret         output : ѡ���õ�����Ⱥ

excellence=individuals.excellence;
pselect=excellence./sum(excellence);
% ��ʵ�� pselect = excellence��

index=[]; 
for i=1:sizepop   % תsizepop������
    pick=rand;
    while pick==0    
        pick=rand;        
    end
    for j=1:sizepop   
        pick=pick-pselect(j);        
        if pick<0        
            index=[index j];
            break;  % Ѱ����������䣬�˴�ת����ѡ����Ⱦɫ��j
        end
    end
end
% ע�⣺��תsizepop�����̵Ĺ����У��п��ܻ��ظ�ѡ��ĳЩȾɫ��

individuals.chrom=individuals.chrom(index,:);
individuals.fitness=individuals.fitness(index);
individuals.concentration=individuals.concentration(index);
individuals.excellence=individuals.excellence(index);
ret=individuals;

end
 
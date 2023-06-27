function newindividuals = incorporate(individuals,sizepop,bestindividuals,overbest)
% ��������п�����룬�γ�����Ⱥ
% individuals         input          ����Ⱥ
% sizepop             input          ������
% bestindividuals     input          �����
% overbest            input          ���������

m = sizepop+overbest;
newindividuals = struct('fitness',zeros(1,m), 'concentration',zeros(1,m),'excellence',zeros(1,m),'chrom',[]);

% �Ŵ������õ��Ŀ���
for i=1:sizepop
    newindividuals.fitness(i) = individuals.fitness(i);   
    newindividuals.concentration(i) = individuals.concentration(i);   
    newindividuals.excellence(i) = individuals.excellence(i);   
    newindividuals.chrom(i,:) = individuals.chrom(i,:);   
end
% ������п���
for i=sizepop+1:m
    newindividuals.fitness(i) = bestindividuals.fitness(i-sizepop);   
    newindividuals.concentration(i) = bestindividuals.concentration(i-sizepop);   
    newindividuals.excellence(i) = bestindividuals.excellence(i-sizepop);   
    newindividuals.chrom(i,:) = bestindividuals.chrom(i-sizepop,:);   
end

end




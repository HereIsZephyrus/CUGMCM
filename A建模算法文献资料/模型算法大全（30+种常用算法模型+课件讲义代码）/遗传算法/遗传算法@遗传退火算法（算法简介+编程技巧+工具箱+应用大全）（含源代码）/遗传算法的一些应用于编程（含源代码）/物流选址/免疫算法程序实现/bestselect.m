function rets=bestselect(individuals,m,n)
% ��ʼ�������,����excellence����Ⱥ���и���Ӧ�ȵ����ƶȵ�overbest�������������
% m                  input          ������
% n                  input          ����������\����Ⱥ��ģ
% individuals        input          ����Ⱥ
% bestindividuals    output         �����\����Ⱥ

% ��Ӣ�������ԣ���fitness��õ�s�������ȴ���������������Ũ�ȸ߶�����̭
s=3;
rets=struct('fitness',zeros(1,n), 'concentration',zeros(1,n),'excellence',zeros(1,n),'chrom',[]);
[fitness,index] = sort(individuals.fitness);
for i=1:s
    rets.fitness(i) = individuals.fitness(index(i));   
    rets.concentration(i) = individuals.concentration(index(i));
    rets.excellence(i) = individuals.excellence(index(i));
    rets.chrom(i,:) = individuals.chrom(index(i),:);
end

% ʣ��m-s������
leftindividuals=struct('fitness',zeros(1,m-s), 'concentration',zeros(1,m-s),'excellence',zeros(1,m-s),'chrom',[]);
for k=1:m-s
    leftindividuals.fitness(k) = individuals.fitness(index(k+s));   
    leftindividuals.concentration(k) = individuals.concentration(index(k+s));
    leftindividuals.excellence(k) = individuals.excellence(index(k+s));
    leftindividuals.chrom(k,:) = individuals.chrom(index(k+s),:);
end

% ��ʣ�࿹�尴excellenceֵ����
[excellence,index]=sort(1./leftindividuals.excellence);

% ��ʣ�࿹��Ⱥ�а�excellence��ѡn-s����õĸ���
for i=s+1:n
    rets.fitness(i) = leftindividuals.fitness(index(i-s));
    rets.concentration(i) = leftindividuals.concentration(index(i-s));
    rets.excellence(i) = leftindividuals.excellence(index(i-s));
    rets.chrom(i,:) = leftindividuals.chrom(index(i-s),:);
end

end
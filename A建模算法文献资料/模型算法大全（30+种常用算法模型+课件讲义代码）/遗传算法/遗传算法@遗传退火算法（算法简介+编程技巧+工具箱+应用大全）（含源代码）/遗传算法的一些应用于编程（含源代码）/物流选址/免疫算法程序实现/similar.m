function resemble = similar(individual1,individual2)
% �������individual1��individual2�����ƶ�
% individual1,individual2    input     ��������
% resemble                   output     ���ƶ�

k=zeros(1,length(individual1));
for i=1:length(individual1)
    if find(individual1(i)==individual2)
        k(i)=1;
    end
end

resemble=sum(k)/length(individual1);

end
function concentration = concentration(i,M,individuals)
% �������Ũ��ֵ
% i              input      ��i������
% M              input      ��Ⱥ��ģ
% individuals    input     ����
% concentration  output     Ũ��ֵ

concentration=0;
for j=1:M
    xsd=similar(individuals.chrom(i,:),individuals.chrom(j,:));  % ��i��������Ⱥ���������ƶ�
    % ���ƶȴ��ڷ�ֵ
    if xsd>0.7
        concentration=concentration+1;
    end
end

concentration=concentration/M;

end
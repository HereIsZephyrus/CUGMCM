function exc=excellence(individuals,M,ps)
% ������己ֳ����
% individuals    input      ��Ⱥ
% M              input      ��Ⱥ��ģ
% ps             input      ���������۲���
% exc            output     ��ֳ����

fit = 1./individuals.fitness;
sumfit = sum(fit);
con = individuals.concentration;
sumcon = sum(con);
for i=1:M
    exc(i) = fit(i)/sumfit*ps +con(i)/sumcon*(1-ps); 
end

end
clear;
clc
for i=1:100
    i
    [L(i),P{i}]=GA_TSP;
end
[a,index]=min(L);
disp('���Ž�:')
disp(P{index})
disp(['�ܾ��룺',num2str(a)]);
A=P{index};
B=L(index);
save P A B


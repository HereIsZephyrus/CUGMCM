function b = de2bi(d, n, p)
%function b = de2bi(d, n, p)
%DE2BI  ת��10������Ϊ����������
%        B = DE2BI(D) ת������������D�ɶ����ƾ���B��
%        �����ƾ���B��ÿһ�б�ʾʮ��������D����Ӧ������
%       B = DE2BI(D, N) ת������������D�ɶ����ƾ���B��
%        ��ָ��B������ΪN��
%       B = DE2BI(D, N, P) ת������������D��p���ƾ���B��
%      p���ƾ���B��ÿһ�б�ʾʮ��������D����Ӧ������
%           ���ߣ�����01-2�����º�
%           zxh21st@163.com
d = d(:);len_d = length(d);
if min(d) < 0, error('Cannot convert a negative number');
elseif ~isempty(find(d==inf)),
     error('Input must not be Inf.');
elseif find(d ~= floor(d)), 
    error('Input must be an integer.');  
end;
if nargin < 2,
   tmp = max(d); b1 = [];
   while tmp > 0
      b1 = [b1 rem(tmp, 2)];tmp = floor(tmp/2);
   end;
   n = length(b1);
end;
if nargin < 3,p = 2;end;
b = zeros(len_d, n);
for i = 1 : len_d
   j = 1;tmp = d(i);
   while (j <= n) & (tmp > 0)
      b(i, j) = rem(tmp, p);tmp = floor(tmp/p);
      j = j + 1;
end;end;


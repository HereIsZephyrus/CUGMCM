data Treatments;  
do id=1 to 10; 
   do drug='A', 'D', 'F';
      input x y @@;
      output;
   end;
end; 
drop id;
datalines;
11 6  6  0  16 13
8  0  6  2  13 10
5  2  7  3  11 18
14 8  8  1  9  5
19 11 18 18 21 23
6  4  8  4  16 12
10 13 19 14 12 5
6  1  8  9  12 16 
11 8  5  1  7  1
3  0  15 9  12 20
;
run;
proc sort data = Treatments;
by drug;
run;
proc print data = Treatments;
run;
proc univariate data = Treatments normal; *������̬��;
var y;
by drug;
run;
proc discrim data = Treatments pool=test; *���鷽������;
class drug;
var y;
run;
proc reg data = Treatments; *�������������;
model y = x;
by drug;
run;
proc glm data = Treatments; * ��glm���̣�ѡ��drug*x����ƽ����;
class drug;
model y = drug x drug*x;
run;
proc glm data = Treatments plot = meanplot(cl); *Э�������;
class drug;
model y = drug x/ solution; *ѡ��solution����ع�ϵ���Ĺ���ֵ�����׼���ͼ�������;
lsmeans drug / stderr pdiff cov out=adjmeans;
run;
proc print data = adjmeans;
run;




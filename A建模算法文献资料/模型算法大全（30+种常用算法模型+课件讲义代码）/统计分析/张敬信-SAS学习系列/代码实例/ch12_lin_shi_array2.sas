data Score;
   array Key[10] $1 _TEMPORARY_;
   array Ans[10] $1;
   array Score[10] _TEMPORARY_;
   * ��������䣨�� 1 �ζ���ʱ����ѡ��ѵ�һ�����ݶ��� Key ���飬��Ϊ��׼��;
   if _N_ = 1 then      
      do i=1 to 10;
         input Key[i] @;
      end;
   * �ٶ���ѧ�� ID ��ѧ������Ĵ�;
   input ID $ @5 (Ans1-Ans10) ($1.); 
   RawScore = 0;
   do i=1 to 10;
      Score[i] = (Ans[i] = Key[i]);  * ���� i �����������������ͬ������߼�ֵ 1 ������ i ��ĵ÷� Score;
      RawScore + Score[i];           * �ۼӸ���ĵ÷�;
   end;
   Percent = 100 * RawScore / 10;   * ���÷�ת��Ϊ�ٷ���;
   drop i;
datalines;
A B C D E E D C B A
001 ABCDEABCDE
002 AAAAABBBBB
;
proc print data = Score;
   title "SCORE Data Set";
   id ID;
   var RawScore Percent;
run;

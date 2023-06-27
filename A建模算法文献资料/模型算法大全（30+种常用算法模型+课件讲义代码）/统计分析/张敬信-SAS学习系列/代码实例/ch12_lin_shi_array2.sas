data Score;
   array Key[10] $1 _TEMPORARY_;
   array Ans[10] $1;
   array Score[10] _TEMPORARY_;
   * 用条件语句（第 1 次读入时），选择把第一行数据读入 Key 数组，作为标准答案;
   if _N_ = 1 then      
      do i=1 to 10;
         input Key[i] @;
      end;
   * 再读入学生 ID 和学生作答的答案;
   input ID $ @5 (Ans1-Ans10) ($1.); 
   RawScore = 0;
   do i=1 to 10;
      Score[i] = (Ans[i] = Key[i]);  * 若第 i 道题的作答，与该题答案相同，则把逻辑值 1 赋给第 i 题的得分 Score;
      RawScore + Score[i];           * 累加各题的得分;
   end;
   Percent = 100 * RawScore / 10;   * 将得分转化为百分制;
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

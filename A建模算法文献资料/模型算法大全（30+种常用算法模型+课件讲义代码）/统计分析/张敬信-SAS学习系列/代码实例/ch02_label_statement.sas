proc print data=Sasuser.admit label;
var actlevel height weight;
label actlevel='Activity Level'
      height='Height in Inches'  /* 也可以每个标签，都用label命令引出 */
      weight='Weight in Pounds';
run;

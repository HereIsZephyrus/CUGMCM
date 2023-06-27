title 'Cluster analysis of simulation technique ';
 data compact;
     keep x y c;
     n=50;scale=1;
     mx=0;my=0;c=1;link generate;
     mx=8;my=0;c=2;link generate;
     mx=4;my=8;c=3;link generate;
     stop;
 generate:
     do i=1 to n;
        x=rannor(1)*scale+mx;
        y=rannor(1)*scale+my;
        output;
     end;
     return;
 data closer;
     keep x y c;
     n=50;scale=1;
     mx=0;my=0;c=2;link generate;
     mx=3;my=0;c=1;link generate;
     mx=1;my=2;c=3;link generate;
     stop;
 generate:
     do i=1 to n;
        x=rannor(9)*scale+mx;
        y=rannor(9)*scale+my;
        output;
     end;
     return;
 data unequal;
     keep x y c;
     mx=1;my=0;n=20;c=3;scale=0.5;link generate;
     mx=6;my=0;n=80;c=1;scale=2.0;link generate;
     mx=3;my=4;n=40;c=2;scale=1.0;link generate;
     stop;
 generate:
     do i=1 to n;
        x=rannor(1)*scale+mx;
        y=rannor(1)*scale+my;
        output;
     end;
     return;
 data elongate;
     keep x y c;
     ma=8 ;mb=0 ;c=2;link generate;
     ma=6 ;mb=8 ;c=3;link generate;
     ma=12;mb=16;c=1;link generate;
     stop;
 generate:
     do i=1 to 50;
        a=rannor(7)*6+ma;
        b=rannor(7)+mb;
        x=a-b;
        y=a+b;
        output;
     end;
     return;
 data circular;
     keep x y c;
     a=2*3.141593;
     scale=0.1;
     mx=0;my=0;n=30;c=1;r=1.0;link generate;
     mx=0;my=0;n=50;c=2;r=3.0;link generate;
     mx=0;my=0;n=70;c=3;r=5.0;link generate;
     stop;
 generate:
     do i=1 to n;
        x=cos(a/n*i)*r+rannor(1)*scale+mx;
        y=sin(a/n*i)*r+rannor(1)*scale+my;
        output;
     end;
     return;
 proc format;
     value symfmt 1='+' 2='-' 3='@' 9='#';
 run;
 %macro analyze(dd,mm,nn);
       proc plot data=&dd formchar='|-----|--'  hpct=100 vpct=100;
            plot y*x=c / hpos=86 vpos=26  ;
            title2 "data=&dd of simulation";
       proc cluster data=&dd out=tree method=&mm ccc pseudo noprint;
            var  x y ;
            copy c;
       proc tree data=tree out=out ncl=&nn noprint;
            copy x y c;
       proc plot data=out formchar='|-----|--'  hpct=100 vpct=100;
            plot y*x=cluster / hpos=86 vpos=26  ;
            title2 "Plot of &nn clusters from method=&mm";
       data contrast;
            set out;
            if cluster=c then
               cc=cluster;
            else
               cc=9;
       proc plot data=contrast formchar='|-----|--'  hpct=100 vpct=100;
            plot y*x=cc / hpos=86 vpos=26  ;
            title2 "Compare and contrast &nn clusters from method=&mm";
 %mend;

 %analyze(compact,average,3)
 %analyze(closer,ward,3)
 %analyze(unequal,eml,3)
 %analyze(elongate,twostage k=10,3)
 %analyze(circular,single,3)

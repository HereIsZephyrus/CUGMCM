proc format;
value specname 1 = 'Setosa'
               2 = 'Versicolor'
               3 = 'Virginica';
data iris;
infile 'C:\MyRawData\Iris.txt';
input sepallen sepalwid petallen petalwid species @@;
format species specname.;
label sepallen = 'Sepal Length in mm.'
      sepalwid = 'Sepal Width  in mm.'
      petallen = 'Petal Length in mm.'
      petalwid = 'Petal Width  in mm.';
run;
proc print data = iris;
title 'Discriminant Analysis of Fisher (1936) Iris Data';
run;
proc stepdisc data = iris short sle=0.3 sls=0.05;
class species;
var sepallen sepalwid petallen petalwid;
run;
proc discrim data = iris method = normal pool = test anova short crosslisterr;
class species;
var petallen;
run;
proc discrim data = iris outstat = plotiris method = normal pool = test manova listerr crosslisterr;
class species;
var petallen petalwid sepalwid;
run;
proc print data = plotiris;
run;


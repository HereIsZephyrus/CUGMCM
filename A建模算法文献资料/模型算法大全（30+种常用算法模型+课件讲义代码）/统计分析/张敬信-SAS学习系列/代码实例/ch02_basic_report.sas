libname patients 'D:\我的文档\My SAS Files\9.3';
proc print data=patients.therapy; /* 注意数据集前加上 data = 否则可能报错 */
run;

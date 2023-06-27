data morning afternoon;
infile 'c:\MyRawData\Zoo.dat';
input Animal $ 1-9 Class $ 11-18 Enclosure $ FeedTime $;
if FeedTime = 'am' then output morning;
else if FeedTime = 'pm' then output afternoon;
else if FeedTime = 'both' then output; /* 每个数据集都输出，省略数据集名 */
run;
proc print data = morning;
title 'Animals with Morning Feedings';
proc print data = afternoon;
title 'Animals with Afternoon Feedings';
run;

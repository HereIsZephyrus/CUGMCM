clear all;clc;close all;
load lujing;                             %其中存储图的邻接矩阵以县政府为起点
dmat=floyed(tu);                         %求图所对应的最短路径矩阵；
[x1,x2,x3,x4]=mtspf_ga(dmat,3,16,100);   %返回求得最优解。
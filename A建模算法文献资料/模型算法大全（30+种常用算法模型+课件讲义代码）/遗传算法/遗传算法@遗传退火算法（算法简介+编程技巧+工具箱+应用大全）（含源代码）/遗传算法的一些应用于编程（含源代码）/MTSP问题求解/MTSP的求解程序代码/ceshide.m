clear all;clc;close all;
load lujing;                             %���д洢ͼ���ڽӾ�����������Ϊ���
dmat=floyed(tu);                         %��ͼ����Ӧ�����·������
[x1,x2,x3,x4]=mtspf_ga(dmat,3,16,100);   %����������Ž⡣
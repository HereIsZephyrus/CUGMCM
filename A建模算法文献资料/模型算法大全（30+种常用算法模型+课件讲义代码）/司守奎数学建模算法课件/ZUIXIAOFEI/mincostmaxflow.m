%最小费用最大流函数
function [flow,val]=mincostmaxflow(rongliang,cost,flowvalue);
%第一个参数：容量矩阵；第二个参数：费用矩阵；
%前两个参数必须在不通路处置零
%第三个参数：指定容量值（可以不写，表示求最小费用最大流）
%返回值flow 为可行流矩阵,val 为最小费用值
global M
flow=zeros(size(rongliang));allflow=sum(flow(1,:));
if nargin<3
flowvalue=M;
end
while allflow<flowvalue
w=(flow<rongliang).*cost-((flow>0).*cost)';
path=floydpath(w);%调用floydpath 函数
if isempty(path)
val=sum(sum(flow.*cost));
return;
end
theta=min(min(path.*(rongliang-flow)+(path.*(rongliang-flow)==0).*M));
theta=min([min(path'.*flow+(path'.*flow==0).*M),theta]);
flow=flow+(rongliang>0).*(path-path').*theta;
allflow=sum(flow(1,:));
end
val=sum(sum(flow.*cost));
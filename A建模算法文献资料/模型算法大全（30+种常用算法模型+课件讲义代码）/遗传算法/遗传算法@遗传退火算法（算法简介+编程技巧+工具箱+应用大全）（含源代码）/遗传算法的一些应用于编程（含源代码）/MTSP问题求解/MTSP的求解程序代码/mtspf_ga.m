function varargout = mtspf_ga(dmat,salesmen,min_tour,pop_size,num_iter,show_prog,show_res)
%dmat 任意两城市间的最短路径矩阵通过floyed算法求得结果。
%salesmen 旅行商个数
%min_tour 每个旅行商最少访问的城市数
%pop_size 种群个体数
%num_iter  迭代的代数
%show_prog,show_res 显示的参数设定
nargs = 7;                      %处理输入参数，用来给定一些默认的参数；
for k = nargin:nargs-1
    switch k
        case 0
            dmat = 10*rand(20,20);
        case 1
            salesmen = 5;
        case 2
            min_tour = 2;
        case 3
            pop_size = 80;
        case 4
            num_iter = 5e3;
        case 5
            show_prog = 1;
        case 6
            show_res = 1;
        otherwise
    end
end

% 检查输入 矩阵
[nr,nc] = size(dmat);
if nr ~= nc
    error('Invalid XY or DMAT inputs!')
end
n = nr - 1; % 除去起始的城市后剩余的城市的数

% 输入参数的检查
salesmen = max(1,min(n,round(real(salesmen(1)))));
min_tour = max(1,min(floor(n/salesmen),round(real(min_tour(1)))));
pop_size = max(8,8*ceil(pop_size(1)/8));
num_iter = max(1,round(real(num_iter(1))));
show_prog = logical(show_prog(1));
show_res = logical(show_res(1));

% 初始化路线、断点的选择
num_brks = salesmen-1;
dof = n - min_tour*salesmen;          % 可以自由访问的城市数
addto = ones(1,dof+1);
for k = 2:num_brks
    addto = cumsum(addto);
end
cum_prob = cumsum(addto)/sum(addto);

% 初始化种群
pop_rte = zeros(pop_size,n);          % 路径集合的种群
pop_brk = zeros(pop_size,num_brks);   % 断点集合的种群
for k = 1:pop_size
    pop_rte(k,:) = randperm(n)+1;
    pop_brk(k,:) = randbreaks();
end

% 选择绘图时的个商人的颜色  可删去；
clr = [1 0 0; 0 0 1; 0.67 0 1; 0 1 0; 1 0.5 0];
if salesmen > 5
    clr = hsv(salesmen);
end

% 开始运行遗传算法过程
global_min = Inf;                %初始化最短路径
total_dist = zeros(1,pop_size);
dist_history = zeros(1,num_iter);
tmp_pop_rte = zeros(8,n);        %当前的路径设置
tmp_pop_brk = zeros(8,num_brks); %当前的断点设置
new_pop_rte = zeros(pop_size,n); %更新的路径设置
new_pop_brk = zeros(pop_size,num_brks);%更新的断点设置
if show_prog
    pfig = figure('Name','MTSPF_GA | Current Best Solution','Numbertitle','off');
end
for iter = 1:num_iter
    % 评价每一代的种群 适应情况并作出选择。
    for p = 1:pop_size
        d = 0;
        p_rte = pop_rte(p,:);
        p_brk = pop_brk(p,:);
        rng = [[1 p_brk+1];[p_brk n]]';
        for s = 1:salesmen
            
            d = d + dmat(1,p_rte(rng(s,1))); % 添加开始的路径
            for k = rng(s,1):rng(s,2)-1
                d = d + dmat(p_rte(k),p_rte(k+1));
            end
            d = d + dmat(p_rte(rng(s,2)),1); % 添加结束的的路径
            dis(p,s)=d;
            %d=d+myLength(dmat,p_rte(rng(s,1):rng(s,2)));%可调用函数处理
        end
        total_dist(p) = d;
        %distan(p)=max(dis(p,:));%计算三个人中的最大值
    end
    
    % 在每代种群中找到最好的路径
    [min_dist,index] = min(total_dist);
    dist_history(iter) = min_dist;     %+max(distan);

    if min_dist < global_min
        global_min = min_dist;
        opt_rte = pop_rte(index,:);             %最优的最短路径
        opt_brk = pop_brk(index,:);             %最优的断点设置
        rng = [[1 opt_brk+1];[opt_brk n]]';     %设置记录断点的方法
    end

    % 遗传算法算子的操作集合
    rand_grouping = randperm(pop_size);
    for p = 8:8:pop_size
        rtes = pop_rte(rand_grouping(p-7:p),:);
        brks = pop_brk(rand_grouping(p-7:p),:);
        dists = total_dist(rand_grouping(p-7:p));
        [ignore,idx] = min(dists);
        best_of_8_rte = rtes(idx,:);
        best_of_8_brk = brks(idx,:);
        rte_ins_pts = sort(ceil(n*rand(1,2)));
        I = rte_ins_pts(1);
        J = rte_ins_pts(2);
        for k = 1:8 % 产生新的方案
            tmp_pop_rte(k,:) = best_of_8_rte;
            tmp_pop_brk(k,:) = best_of_8_brk;
            switch k
                case 2 % 倒置操作
                    tmp_pop_rte(k,I:J) = fliplr(tmp_pop_rte(k,I:J));
                case 3 % 互换操作
                    tmp_pop_rte(k,[I J]) = tmp_pop_rte(k,[J I]);
                case 4 % 滑动平移操作
                    tmp_pop_rte(k,I:J) = tmp_pop_rte(k,[I+1:J I]);
                case 5 % 更新断点
                    tmp_pop_brk(k,:) = randbreaks();
                case 6 % 倒置并更新断点
                    tmp_pop_rte(k,I:J) = fliplr(tmp_pop_rte(k,I:J));
                    tmp_pop_brk(k,:) = randbreaks();
                case 7 % 互换并更新断点
                    tmp_pop_rte(k,[I J]) = tmp_pop_rte(k,[J I]);
                    tmp_pop_brk(k,:) = randbreaks();
                case 8 % 评议并更新断点
                    tmp_pop_rte(k,I:J) = tmp_pop_rte(k,[I+1:J I]);
                    tmp_pop_brk(k,:) = randbreaks();
                otherwise % 不进行操做
            end
        end
        new_pop_rte(p-7:p,:) = tmp_pop_rte;
        new_pop_brk(p-7:p,:) = tmp_pop_brk;
    end
    pop_rte = new_pop_rte;
    pop_brk = new_pop_brk;
end

% 返回结果部分
rng = [[1 opt_brk+1];[opt_brk n]]';
dis_e=zeros(1,salesmen);    %设置并计算每个旅行商的最短路径
for s = 1:salesmen
    dis_e(s)=myLength(dmat,opt_rte(rng(s,1):rng(s,2)));
end

if nargout
    varargout{1} = opt_rte;
    varargout{2} = opt_brk;
    varargout{3} = min_dist;
    varargout{4} = dis_e;
end
%做出迭代过程的图示
plot(dist_history);
grid on;xlabel('迭代的代数');ylabel('所走的路径之和');
    % 随机产生一套断点 的集合
    function breaks = randbreaks()
        if min_tour == 1 % 一个旅行商时，没有断点的设置
            tmp_brks = randperm(n-1);
            breaks = sort(tmp_brks(1:num_brks));
        else % 强制断点至少  找 到最短的履行长度
            num_adjust = find(rand < cum_prob,1)-1;
            spaces = ceil(num_brks*rand(1,num_adjust));
            adjust = zeros(1,num_brks);
            for kk = 1:num_brks
                adjust(kk) = sum(spaces == kk);
            end
            breaks = min_tour*(1:num_brks) + cumsum(adjust);
        end
    end
end

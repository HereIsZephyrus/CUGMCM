function varargout = mtspf_ga(dmat,salesmen,min_tour,pop_size,num_iter,show_prog,show_res)
%dmat ���������м�����·������ͨ��floyed�㷨��ý����
%salesmen �����̸���
%min_tour ÿ�����������ٷ��ʵĳ�����
%pop_size ��Ⱥ������
%num_iter  �����Ĵ���
%show_prog,show_res ��ʾ�Ĳ����趨
nargs = 7;                      %���������������������һЩĬ�ϵĲ�����
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

% ������� ����
[nr,nc] = size(dmat);
if nr ~= nc
    error('Invalid XY or DMAT inputs!')
end
n = nr - 1; % ��ȥ��ʼ�ĳ��к�ʣ��ĳ��е���

% ��������ļ��
salesmen = max(1,min(n,round(real(salesmen(1)))));
min_tour = max(1,min(floor(n/salesmen),round(real(min_tour(1)))));
pop_size = max(8,8*ceil(pop_size(1)/8));
num_iter = max(1,round(real(num_iter(1))));
show_prog = logical(show_prog(1));
show_res = logical(show_res(1));

% ��ʼ��·�ߡ��ϵ��ѡ��
num_brks = salesmen-1;
dof = n - min_tour*salesmen;          % �������ɷ��ʵĳ�����
addto = ones(1,dof+1);
for k = 2:num_brks
    addto = cumsum(addto);
end
cum_prob = cumsum(addto)/sum(addto);

% ��ʼ����Ⱥ
pop_rte = zeros(pop_size,n);          % ·�����ϵ���Ⱥ
pop_brk = zeros(pop_size,num_brks);   % �ϵ㼯�ϵ���Ⱥ
for k = 1:pop_size
    pop_rte(k,:) = randperm(n)+1;
    pop_brk(k,:) = randbreaks();
end

% ѡ���ͼʱ�ĸ����˵���ɫ  ��ɾȥ��
clr = [1 0 0; 0 0 1; 0.67 0 1; 0 1 0; 1 0.5 0];
if salesmen > 5
    clr = hsv(salesmen);
end

% ��ʼ�����Ŵ��㷨����
global_min = Inf;                %��ʼ�����·��
total_dist = zeros(1,pop_size);
dist_history = zeros(1,num_iter);
tmp_pop_rte = zeros(8,n);        %��ǰ��·������
tmp_pop_brk = zeros(8,num_brks); %��ǰ�Ķϵ�����
new_pop_rte = zeros(pop_size,n); %���µ�·������
new_pop_brk = zeros(pop_size,num_brks);%���µĶϵ�����
if show_prog
    pfig = figure('Name','MTSPF_GA | Current Best Solution','Numbertitle','off');
end
for iter = 1:num_iter
    % ����ÿһ������Ⱥ ��Ӧ���������ѡ��
    for p = 1:pop_size
        d = 0;
        p_rte = pop_rte(p,:);
        p_brk = pop_brk(p,:);
        rng = [[1 p_brk+1];[p_brk n]]';
        for s = 1:salesmen
            
            d = d + dmat(1,p_rte(rng(s,1))); % ��ӿ�ʼ��·��
            for k = rng(s,1):rng(s,2)-1
                d = d + dmat(p_rte(k),p_rte(k+1));
            end
            d = d + dmat(p_rte(rng(s,2)),1); % ��ӽ����ĵ�·��
            dis(p,s)=d;
            %d=d+myLength(dmat,p_rte(rng(s,1):rng(s,2)));%�ɵ��ú�������
        end
        total_dist(p) = d;
        %distan(p)=max(dis(p,:));%�����������е����ֵ
    end
    
    % ��ÿ����Ⱥ���ҵ���õ�·��
    [min_dist,index] = min(total_dist);
    dist_history(iter) = min_dist;     %+max(distan);

    if min_dist < global_min
        global_min = min_dist;
        opt_rte = pop_rte(index,:);             %���ŵ����·��
        opt_brk = pop_brk(index,:);             %���ŵĶϵ�����
        rng = [[1 opt_brk+1];[opt_brk n]]';     %���ü�¼�ϵ�ķ���
    end

    % �Ŵ��㷨���ӵĲ�������
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
        for k = 1:8 % �����µķ���
            tmp_pop_rte(k,:) = best_of_8_rte;
            tmp_pop_brk(k,:) = best_of_8_brk;
            switch k
                case 2 % ���ò���
                    tmp_pop_rte(k,I:J) = fliplr(tmp_pop_rte(k,I:J));
                case 3 % ��������
                    tmp_pop_rte(k,[I J]) = tmp_pop_rte(k,[J I]);
                case 4 % ����ƽ�Ʋ���
                    tmp_pop_rte(k,I:J) = tmp_pop_rte(k,[I+1:J I]);
                case 5 % ���¶ϵ�
                    tmp_pop_brk(k,:) = randbreaks();
                case 6 % ���ò����¶ϵ�
                    tmp_pop_rte(k,I:J) = fliplr(tmp_pop_rte(k,I:J));
                    tmp_pop_brk(k,:) = randbreaks();
                case 7 % ���������¶ϵ�
                    tmp_pop_rte(k,[I J]) = tmp_pop_rte(k,[J I]);
                    tmp_pop_brk(k,:) = randbreaks();
                case 8 % ���鲢���¶ϵ�
                    tmp_pop_rte(k,I:J) = tmp_pop_rte(k,[I+1:J I]);
                    tmp_pop_brk(k,:) = randbreaks();
                otherwise % �����в���
            end
        end
        new_pop_rte(p-7:p,:) = tmp_pop_rte;
        new_pop_brk(p-7:p,:) = tmp_pop_brk;
    end
    pop_rte = new_pop_rte;
    pop_brk = new_pop_brk;
end

% ���ؽ������
rng = [[1 opt_brk+1];[opt_brk n]]';
dis_e=zeros(1,salesmen);    %���ò�����ÿ�������̵����·��
for s = 1:salesmen
    dis_e(s)=myLength(dmat,opt_rte(rng(s,1):rng(s,2)));
end

if nargout
    varargout{1} = opt_rte;
    varargout{2} = opt_brk;
    varargout{3} = min_dist;
    varargout{4} = dis_e;
end
%�����������̵�ͼʾ
plot(dist_history);
grid on;xlabel('�����Ĵ���');ylabel('���ߵ�·��֮��');
    % �������һ�׶ϵ� �ļ���
    function breaks = randbreaks()
        if min_tour == 1 % һ��������ʱ��û�жϵ������
            tmp_brks = randperm(n-1);
            breaks = sort(tmp_brks(1:num_brks));
        else % ǿ�ƶϵ�����  �� ����̵����г���
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

function [X2,fX2] = Anneal5(x,fx,FitnessFcn,B,stepSize,A,LB,UB,R,L,t)
GenomeLength = length(x);
Lbnd = B(1,:);
Ubnd = B(2,:);
span = max([sqrt(eps)*x;min([x-Lbnd;Ubnd-x])]);

X2=[];fX2=[];
r = 0; l = 0;
while r<R && l<L
    ra = 2*rand(1,GenomeLength)-1;
    dx = sign(ra) .* t .* ((1+1/t).^abs(ra)-1);
    x2 = x  + span .* dx;
    y2 = (A*x2')';
    if all(LB'<y2 & y2<UB');
        l = l+1;
        fx2 = feval(FitnessFcn,x2);
        delta_f = fx2 - fx;
        if delta_f < 0
            r = r+1;
            x = x2;
            fx = fx2;
            span = min([x-Lbnd;Ubnd-x]);
            X2 = [X2;x2];
            fX2 = [fX2;fx2];
        elseif exp(-delta_f/t) > rand
            r = r+1;
            x = x2;
            fx = fx2;
            span = min([x-Lbnd;Ubnd-x]);
            X2 = [X2;x2];
            fX2 = [fX2;fx2];
        end
    end
end
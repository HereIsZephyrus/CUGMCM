%.........�ṩ��/daichenglei/.............
%.........������Ϊͻ�����mutation operator.........
%����Ŀ��Ϊ���㻥������
%******************����������˵��******************
%-------pMutation��ͻ�����
function moffspring=mutation(offspring,nCity,pMutation,nPopulation,rr,pi,nRemain,Shock)
exchange=0;
ccc=0;
for m=1:nPopulation
    moffspring(m,:)=offspring(m,:);
    k=find(rr==m);
    if size(k,1)~=0&rand<pi(3)&ccc<nRemain
        m=rr(k(1,1),1);
        moffspring(m,:)=moffspring(m,:);
        ccc=ccc+1;
    else
        for i=1:nCity-1
            if rand<pMutation+Shock
                j=unidrnd(nCity-1);
                while i==j
                    j=unidrnd(nCity-1);
                end
                exchange=moffspring(m,i);
                moffspring(m,i)=moffspring(m,j);
                moffspring(m,j)=exchange;
            end
        end
    end
end
%offspring         %��ʾͻ����Ӵ�

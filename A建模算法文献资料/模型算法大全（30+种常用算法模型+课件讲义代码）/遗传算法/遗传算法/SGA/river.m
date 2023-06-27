clear all;clc
a=[0,0;0,1;0,2;0,3;3,0;3,1;3,2;3,3;1,1;2,2];d=[0,2;2,0;1,1;0,1;1,0];i=1;j=1;k=1;s(1,:)=[3,3];
disp('´Ë°¶ - ´¬ÉÏ - ¶Ô°¶')
for i=1:12
    for j=1:5
        t=0;r=mod(i,2);m=r;u=0;
        for k=1:10
            if s(i,:)+(-1)^i*d(j,:)==a(k,:)
                t=1;
            end
        end
        if i+1>=3
            for m=1+r:2:i-1
                if s(i,:)+(-1)^i*d(j,:)==s(m,:)
                    u=1;
                end
            end
        end
        if t==1
            if u==0
                s(i+1,:)=s(i,:)+(-1)^i*d(j,:);
                c(i+1,:)=d(j,:);
                break;
            elseif u==1 
                continue;
            end
            else continue;
        end
    end
if t==0 
    disp('No Result');
    break;
end
b(i+1,:)=[3,3]-s(i+1,:);
play=sprintf('{%d,%d}-{%d,%d}-{%d,%d}',s(i,1),s(i,2),c(i+1,1),c(i+1,2),b(i+1,1),b(i+1,2));
  disp(play)
  if s(i+1,:)==[0,0]
  break;
  end
end

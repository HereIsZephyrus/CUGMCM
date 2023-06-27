function a=mutate(a)
L=length(a);
rray=randperm(L);
[a(rray(1)),a(rray(2))]=exchange(a(rray(1)),a(rray(2)));

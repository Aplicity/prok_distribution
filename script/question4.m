
[Idx,C]=kmeans(X,3)
[m1,n1]=find(Idx==1);
[m2,n2]=find(Idx==2);
[m3,n3]=find(Idx==3);

demand1=demand(m1);
demand2=demand(m2);
demand3=demand(m3);

sum1=sum(demand1);
sum2=sum(demand2);
sum3=sum(demand3);

X1=X(m1);X2=X(m2);X3=X(m3);


A=dianqi(:,2:3)
[m,n]=size(A);

d=zeros(m,n);
for i=1:m
    for j=i+1:m
        d(i,j)=mandist(A(i,:),A(j,:)');
    end
end
nd=nonzeros(d);
nd=union(nd,nd)
for i=1:m-1
    nd_min=min(nd);
    [row,col]=find(d==nd_min);
    tm=union(row,col);
    tm=reshape(tm,1,length(tm));
    s(i)={char(['��',int2str(i),'�κϳɣ�ƽ̨�߶�Ϊ',num2str(nd_min),'ʱ�ķ�����Ϊ��',int2str(tm)])};
    %���ϴ�����{}����������
    nd(find(nd==nd_min))=[];
    if length(nd)==0
        break
    end
end
s(:)
    
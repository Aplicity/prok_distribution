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
    s(i)={char(['第',int2str(i),'次合成，平台高度为',num2str(nd_min),'时的分类结果为：',int2str(tm)])};
    %以上大括号{}代表建立数组
    nd(find(nd==nd_min))=[];
    if length(nd)==0
        break
    end
end
s(:)
    
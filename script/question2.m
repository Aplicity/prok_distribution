
ave=mean(data(:,2:end-1)); %���ÿ��������¶�ƽ��ֵ
% �����ǳ�ȡƽ��ֵ����5������
t=1
while t<11
[m,i]=max(ave)
ave(i)=0
y_max(t)=m
max_index(t)=i
t=t+1
end
%���³�ȡƽ����Сֵ��5������
t=1
ave=mean(data(:,2:end-1)); 
while t<11
[m,i]=min(ave)
ave(i)=10000
y_min(t)=m
min_index(t)=i
t=t+1
end

% ������ÿ������Ķ�����������
for i=1:154
    rate(i)=data(60,i+1)/data(1,i+1);
end
[a,b]=max(rate)

max_rate=rate(max_index); %��ֵ���ĳ�����������
min_rate=rate(min_index); %��ֵ��С�ĳ�����������

%������ ����������С�ĳ���

t=1
while t<11
[m,i]=min(rate)
rate(i)=10000
min_rate_val(t)=m
min_rate_index(t)=i
t=t+1
end

%�����������������ĳ��������һ���µ�ֵ

for i=1:154
    rate(i)=data(60,i+1)/data(1,i+1);
end
t=1
while t<11
[m,i]=max(rate)
rate(i)=-100
max_rate_val(t)=m
max_rate_index(t)=i
t=t+1
end

max_rate_last_val=data(end,max_rate_index+1)

%����������������С�ĳ��������һ���µ�ֵ

for i=1:154
    rate(i)=data(60,i+1)/data(1,i+1);
end
t=1
while t<11
[m,i]=min(rate)
rate(i)=-100
min_rate_val(t)=m
min_rate_index(t)=i
t=t+1
end

min_rate_last_val=data(end,min_rate_index+1)














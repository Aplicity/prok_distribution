
ave=mean(data(:,2:end-1)); %求出每个城镇的月度平均值
% 以下是抽取平均值最大的5个城镇
t=1
while t<11
[m,i]=max(ave)
ave(i)=0
y_max(t)=m
max_index(t)=i
t=t+1
end
%以下抽取平均最小值的5个城镇
t=1
ave=mean(data(:,2:end-1)); 
while t<11
[m,i]=min(ave)
ave(i)=10000
y_min(t)=m
min_index(t)=i
t=t+1
end

% 以下求每个城镇的定基增长幅度
for i=1:154
    rate(i)=data(60,i+1)/data(1,i+1);
end
[a,b]=max(rate)

max_rate=rate(max_index); %均值最大的城市增长幅度
min_rate=rate(min_index); %均值最小的城市增长幅度

%以下求 增长幅度最小的城镇

t=1
while t<11
[m,i]=min(rate)
rate(i)=10000
min_rate_val(t)=m
min_rate_index(t)=i
t=t+1
end

%以下求增长幅度最大的城镇中最后一个月的值

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

%以下求增长幅度最小的城镇中最后一个月的值

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














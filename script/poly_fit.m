y=data(:,end)
t=[1:60]';
p=polyfit(t,y,2)
y_pred=polyval(p,t);
figure(1)
plot(t,y,'*',t,y_pred,'o')
legend('ʵ��ֵ','Ԥ��ֵ')

figure(2)
t_pred=[1:100]
f=-2.573*t_pred.*t_pred+373.2*t_pred+1.063*10^5; %��Ϸ���
plot(t_pred,f)


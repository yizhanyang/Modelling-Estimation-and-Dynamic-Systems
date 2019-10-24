clear all
close all
clc
load data2.mat

R=randperm(height(data2));
R=randperm(200);
data2=data2(R(1:200),:);
R=randperm(height(data2));
array2=table2array(data2);

x=array2(:,6);
y=array2(:,7);
x_init=zeros(200,1);
y_init=zeros(200,1);
x_init(:)=1.43;
y_init(:)=0.63;
x1=x+x_init;
y1=y+y_init;
dis=sqrt(x1.^2+y1.^2);
title=ones(200,1);
tuple=zeros(200,6);
tuple(:,1)=title;
tuple(:,2:5)=array2(:,2:5);
tuple(:,6)=dis;
list=[1:140];
train=tuple(list,:);
val=tuple(141:200,:);

predict=array2(:,1);
T=predict(list);
N = inv(train'*train)*train'*T;

y_train=train*N;
P=predict(141:200,:);
y_val=val*N;

plot(y_train,T,'ro')
hold on 

plot(200000:100:320000,200000:100:320000)
hold on
plot(y_val,P,'b*')
legend({'Training','Fit','Valiadation'},'Location','southeast')
xlabel('x')
ylabel('h(x)')

yy=tuple*N;
SSE = sum((yy-predict).^2)
SST=sum((predict.^2))-200*(mean(predict).^2);
R_square=1-SSE/SST

feature=[45,1978,1,1,0.2,0.3;
    56,2000,2,2,0.6,1.6;
    72,2016,3,6,1.4,0.65];
area=feature(:,1);
year=feature(:,2);
room=feature(:,3);
floor=feature(:,4);
distance_x=feature(:,5);
distance_y=feature(:,6);
x_t= zeros(3,1)+1;
distance=((distance_x-1.43).^2+(distance_y-0.63).^2).^0.5;
house_data=[x_t,area,year,room,floor,distance];
price=house_data*N;



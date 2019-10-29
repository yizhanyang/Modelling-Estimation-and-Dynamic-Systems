clear all; close all;
load data3.mat;

h=figure;
figure(h);
subplot(3,1,1);
scatter(x,y);
n=length(x);
x=log(x);
y=log(y);
xmean=mean(x);
ymean=mean(y);
sxy=sum(x.*y);
sxx=sum(x.^2);
theta2=(sxy-n*xmean*ymean)/(sxx-n*xmean^2);
disp(['theta1=',num2str(theta2)]);
theta1=ymean-theta2*xmean;
disp(['theta2=',num2str(theta1)]);

yhat=theta1+theta2*x;
figure(h);
subplot(3,1,2);
hold on,

plot(x,yhat);
k1=exp(theta1);
disp(['k1=',num2str(k1)]);
k2=theta2;
disp(['k2=',num2str(k2)]);
xaxis = linspace(0,15,100);
plot(xaxis, k1*xaxis.^k2);
grid on;

a=0:0.01:15;
b=k1*a.^k2;
hold on,
figure(h);
hold on,
subplot(3,1,1);
plot(a,b);
hold on,
scatter(xv,yv);

%SSE,R2 for the training data
x=exp(x);
y=exp(y);
yhat=exp(yhat);
ymean=exp(ymean);
SE=(y-yhat).^2;
SSE=sum(SE);
disp(['SSE=',num2str(SSE)]);
SE1=(y-ymean).^2;
SST=sum(SE1);
R2=1-SSE/SST;
disp(['R2=',num2str(R2)]);

%SSE for the validation data
yvhat=k1*xv.^k2;
SEv=(yv-yvhat).^2;
SSEv=sum(SEv);
disp(['SSEv=',num2str(SSEv)]);


SSE_valid = [];
P1 = polyfit(x,y,1);
yestv1 = polyval(P1,xv);
SSE_valid(1) = sum((yv-yestv1).^2);
P2 = polyfit(x,y,2);
yestv2 = polyval(P2,xv);
SSE_valid(2) = sum((yv-yestv2).^2);
P3 = polyfit(x,y,3);
yestv3 = polyval(P3,xv);
SSE_valid(3) = sum((yv-yestv3).^2);
P4 = polyfit(x,y,4);
yestv4 = polyval(P4,xv);
SSE_valid(4) = sum((yv-yestv4).^2);
P5 = polyfit(x,y,5);
yestv5 = polyval(P5,xv);
SSE_valid(5) = sum((yv-yestv5).^2);
P6 = polyfit(x,y,6);
yestv6 = polyval(P6,xv);
SSE_valid(6) = sum((yv-yestv6).^2);
P7 = polyfit(x,y,7);
yestv7 = polyval(P7,xv);
SSE_valid(7) = sum((yv-yestv7).^2);

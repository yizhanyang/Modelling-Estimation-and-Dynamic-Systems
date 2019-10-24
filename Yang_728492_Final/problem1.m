close all
clear all
m=0.1;
k=10;
b=10;
z1=0.1;
z2=0;
g=9.81;
p=1.5*10^(-5);
tspan=[0,10];
init=[z1,z2];

E=@(t) 10*sin(10*t);
f=@(t,z) rhs(t,z,E);
[t,z] = ode45(f,tspan,init);
subplot(1,2,1);
plot(t,z(:,1),'-.','LineWidth',1.2);
subplot(1,2,2);
plot(t,z(:,2),'-.','LineWidth',1.2);

function dzdt = rhs(t,z,E)
m=0.1;
k=10;
b=10;
z0=0.2;    
g=9.81;
p=1.5*10^(-5);
dzdt=[z(2);-p/m*((E(t))/(z(1)+z0)^2)-z(2)*b/m-z(1)*k/m+g];
end
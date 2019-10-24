close all;
clc;
clear;
Rc=0.0004;
V=100*90*25*1e-18;
ro=8092;
m=V*ro;
phi=0.00072;
k=3750;
I=0.40;
h=3.39*1e-7;
C=600*1e-6;
gamma=0.072;

A=-gamma*C*sin(phi)/(Rc*h);
B=k*V*I^2/Rc^2 ;
C=[1,0];D=0;

system=@(t,x) A*x+B;

options=odeset('RelTol',1e-4,'AbsTol',1e-6);
timeSpan=[0 100*1e-3];
[t,x]=ode45(system,timeSpan,0,options);

plot(t,x)
title(' Magmap ');
xlabel('Time (s)');
ylabel('Position (m)');
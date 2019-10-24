close all;
clc;
clear;

V=10;
q0=0.25;
qi=0.25;
k0=9.4;
E=2500;
R=8.31;
T=293;
k=k0*exp(-E/(R*T));

A=[ -q0/V,0;k*q0/V,-q0/V ];
B=[qi/V;-q0/V];
C=[0,1];
D=0;
u=@(t) 1/(0.3*sqrt(pi))*exp(-(t/0.3).^2);

system=@(t,x) A*x+B*u(t);

options=odeset('RelTol',1e-4,'AbsTol',1e-6);
timeSpan=[0 20];
[x,t]=ode45(system,timeSpan,[0 0]',options);

plot(x,t)
title('ChemReactor ');
xlabel('time(s)');
ylabel('the concentration of reactant and product');
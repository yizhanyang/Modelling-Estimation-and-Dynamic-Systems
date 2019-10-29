%Queston_A
clear all
clc
Hs=tf([1],[1,3,2]);
n = 2001;
t=0:0.1:200;
ua = idinput(n,'prbs');
a=lsim(Hs,ua,t);
u = iddata(a,ua,0.1);
plot(u);
figure(1)

%Question_B
r = xcorr(a,200,'coeff');
plot(r);
figure(2)

%Question_C
[R,r1,c1]=cra(u,10,0,1);
hold on;
plot(R);
hold on;
impulse(Hs,10);
hold off;
figure(3)


%Question_D
spe= spa(u);
bode(spe);
tra= etfe(u);
hold on;
bode(tra);
figure(4)






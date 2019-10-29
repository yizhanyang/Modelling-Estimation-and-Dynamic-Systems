%Question_A
clear all
clc
train_data=[1980 6.463001268 4.305147809
1981 3.833797117 3.578050295
1982 7.341931344 1.101034617
1983 9.245216354 4.83543596
1984 13.63833419 1.471102565
1985 11.9091084 2.90843419
1986 7.331332019 2.480293491
1987 9.912166139 1.723703014
1988 9.457901151 7.302963549
1989 2.600704109 3.736988483
1990 2.393612459 3.366900569
1991 7.81295779 -0.982546363
1992 12.82494547 3.390699613
1993 12.56602799 2.706142818
1994 11.78156869 4.604720942
1995 9.750279002 5.527286718
1996 8.782184882 5.526796934
1997 8.118548119 2.118629228
1998 6.80780632 4.243707664
1999 6.739270027 6.892479991
2000 7.640001656 2.015558933
2001 7.555801672 3.021236285
2002 8.401915061 2.05811615
2003 9.352364261 6.086693622
2004 9.45917505 6.187574525
2005 10.74255231 7.56712016
2006 12.09183627 7.584629578
2007 13.63634486 8.15356726
2008 9.093872102 2.375249298
2009 8.857029819 6.950038738
2010 10.10310072 8.763184414
2011 9.012854035 5.248536528
2012 7.332030984 4.134717786
2013 7.226936454 5.096691727
2014 6.755778416 6.234203582 ];
year=train_data(:,1);
CH1=train_data(:,2);
IN1=train_data(:,3);
save data1 year CH1 IN1

%Question_B
clear all
clc
load data1
lag=20;
[cr,lgs]= xcorr(CH1,IN1,lag,'coeff');
subplot(2,1,1);
plot(lgs,cr);
figure(1)

%Question_C
for i=4:4:31
CH1(i)=[];
IN1(i)=[];
end
for i=4:4:31
j=i/4;
CH2(j)=CH1(i);
IN2(j)=IN1(i);
end
p=polyfit(CH1,IN1,1)
k=polyval(p,CH2);
subplot(2,1,2);
plot(CH2,k);
hold on;
scatter(CH2,IN2);
hold off;
k=polyval(p,6.36)
figure(2)



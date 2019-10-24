{
houseno=[45,1978,1,1,0.2,0.3;
    56,2000,2,2,0.6,1.6;
    72,2016,3,6,1.4,0.65];
areavn=houseno(:,1);
yearvn=houseno(:,2);
roomvn=houseno(:,3);
floorvn=houseno(:,4);
xcovn=houseno(:,5);
ycovn=houseno(:,6);
x0vn= zeros(3,1)+1;
distancevn=((xcovn-1.43).^2+(ycovn-0.63).^2).^0.5;
houseparamsvn=[x0vn,areavn,yearvn,roomvn,floorvn,distancevn];
priceestvn=houseparamsvn*k;
%}

end

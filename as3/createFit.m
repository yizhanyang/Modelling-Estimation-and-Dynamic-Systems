function [fitresult, gof] = createFit(x, y, u)

[xData, yData, zData] = prepareSurfaceData( x, y, u );

ft = fittype( 'poly22' );

[fitresult, gof] = fit( [xData, yData], zData, ft );

figure( 'Name', 'createFit' );
h = plot( fitresult, [xData, yData], zData );
legend( h, 'CreateFit', 'u, x, y');
xlabel x
ylabel y
zlabel u
grid on
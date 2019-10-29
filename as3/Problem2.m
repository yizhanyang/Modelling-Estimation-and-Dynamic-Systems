clear all; close all;

load('data2.mat');

[gridx,gridy] = meshgrid(0:0.05:1,0:0.05:1);

[ufit, gofu] = createFit(x, y, u);
[vfit, gofv] = createFit(x, y, v);

quiver(gridx, gridy, ufit(gridx, gridy), vfit(gridx, gridy));
axis equal
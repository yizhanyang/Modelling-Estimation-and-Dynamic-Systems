load('data4.mat');
global x y
k1 = 1;
k2 = 1;
k = [k1 k2]; 
k = fminsearch('computeCost', k);

k1_surf = linspace(1.4, 1.7, 100);
k2_surf = linspace(0.1, 0.3, 100);

J_surf = zeros(length(k1_surf), length(k2_surf));

for i = 1:length(k1_surf)
    for j = 1:length(k2_surf)
    t = [k1_surf(i); k2_surf(j)];
    J_surf(i,j) = computeCost(t);
    end
end

J_surf = J_surf';

figure;
surf(k1_surf, k2_surf, J_surf);
xlabel('k_1'); ylabel('k_2');

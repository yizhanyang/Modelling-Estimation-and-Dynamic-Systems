function SSE = computeCost(k)
global x y
k1 = k(1);
k2 = k(2);
SSE = sum((y - (k1*(1-exp(-k2*x)))).^2);
end
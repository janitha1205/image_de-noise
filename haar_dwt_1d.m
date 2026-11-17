
% --- Example Usage ---
x = rand(100,1);
[cA, cD] = wavelet_h(x);
xi=inverse_wavelet_h(cA, cD,30);
disp('Approximation:');
disp(xi);

disp('real valves:');
disp(x);

disp('number of coffecients')
disp(cA)
disp('number of detail coffecients')
disp(cD)

plot(xi,'*b');
hold on;
plot(x,'r')






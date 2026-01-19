%% 1. uzdevums. Kubiskā splaina interpolācijas kļūdas grafiks
clc, clearvars, format compact, close all

f = @(x) sin(3 + sin(x)) .* (5).^(1/3) .* atan(3 + x.^2);

a = 3;
b = 11;
delta_x = 2;

xnodes = a:delta_x:b;
ynodes = f(xnodes);

x_pr = linspace(a, b, 200);
y_spline = interp1(xnodes, ynodes, x_pr, 'spline');
 
error = abs(f(x_pr) - y_spline);

figure
plot(x_pr, error, 'g:', 'LineWidth', 3)
title('Interpolācijas kļūda')
xlabel('x')
ylabel('Kļūda')
grid on
xlim([a, b])

fprintf('Maksimālā interpolācijas kļūda: %.6f\n', max(error));

%% 2. uzdevums. Ņūtona interpolācijas kļūdas grafiks
clc, clearvars, format compact, close all

f = @(x) (x.^4).^(1/5) + (2*x + x.^2) .* log(x);

a = 1;
b = 13;
delta_x = 2;
xnodes = a:delta_x:b;
ynodes = f(xnodes);
m = length(xnodes);

coef = ynodes;
for k = 2:m
    coef(k:m) = (coef(k:m) - coef(k-1:m-1)) ./ (xnodes(k:m) - xnodes(1:m-k+1));
end

syms x
pol = coef(m);
for k = m-1:-1:1
    pol = pol * (x - xnodes(k)) + coef(k);
end
polyn(x) = collect(pol);

x_pr = linspace(a, b, 1000);
y_polyn = double(polyn(x_pr));
y_exact = f(x_pr);
error = abs(y_exact - y_polyn);

plot(x_pr, error, 'k-', 'LineWidth', 1.5)
title('Nūtona interpolācijas kļūda |f(x) - pol(x)|')
xlabel('x')
ylabel('Interpolācijas kļūda')
xlim([a, b])
grid on
box off

%% 3. uzdevums. Ņūtona polinoma koeficients pie x^4
clc, clearvars, format compact

f = @(x) (2 + log(1 + 2*x.^3)).^(1/4);

a = 2;
b = 8;
delta_x = 1;

xnodes = a:delta_x:b;
ynodes = f(xnodes);
m = length(xnodes);

coef = ynodes;
for k = 2:m
    coef(k:m) = (coef(k:m) - coef(k-1:m-1)) ./ (xnodes(k:m) - xnodes(1:m-k+1));
end

syms x
pol = coef(m);
for k = m-1:-1:1
    pol = pol * (x - xnodes(k)) + coef(k);
end
polyn(x) = collect(pol);

coefpol = sym2poly(polyn);
x4_coef = coefpol(3);
fprintf('%.4f\n', x4_coef);

%% 4. uzdevums. Kubiskā splaina vērtība punktā
clc, clearvars, format compact

f = @(x) (sin(x).^2) .* sqrt(log(3 + cos(x)) + 5*x.^(1/4));

a = 5;
b = 13;
delta_x = 2;
xnodes = a:delta_x:b;
ynodes = f(xnodes);
x0 = 6.45;
spline_value = interp1(xnodes, ynodes, x0, 'spline');

fprintf('%.4f\n', spline_value);

%% 5. uzdevums. Kubiskā splaina grafiks
clc, clearvars, format compact, close all

f = @(x) log(cos(5 + x) + (2 + 0.3*x).^2) .* log(4 + 2*x + x.^3);

a = 5;
b = 10;
delta_x = 1;
xnodes = a:delta_x:b;
ynodes = f(xnodes);

x_pr = linspace(a, b, 200);
y_spline = interp1(xnodes, ynodes, x_pr, 'spline');

figure('Position', [100, 100, 800, 600])
plot(x_pr, y_spline, 'r-', 'LineWidth', 2, 'DisplayName', 'Kubiskais splains')
hold on
plot(xnodes, ynodes, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'blue', 'DisplayName', 'Interpolācijas mezgli')
grid on
title('Kubiskā splaina interpolācija')
xlabel('x')
ylabel('y')
legend('Location', 'best')
xlim([a, b])

fprintf('Funkcijas vērtības mezglos:\n');
for i = 1:length(xnodes)
    fprintf('x = %d, f(x) = %.6f\n', xnodes(i), ynodes(i));
end
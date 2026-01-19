%% 1. uzdevums. Kubiskā splaina interpolācijas kļūda
clc, clearvars, format compact

f = @(x) cos(2 + sin(3*x)) .* (3 + 2*log(1 + 3*x)).^(1/3);
a = 4;
b = 16;
delta_x = 3;

xnodes = a:delta_x:b;
ynodes = f(xnodes);

x0 = 11.12;
spline_result = interp1(xnodes, ynodes, x0, 'spline');
exact_value = f(x0);
error = abs(spline_result - exact_value);
fprintf('%.4f\n', error);

%% 2. uzdevums. Ņūtona interpolācijas polinoma grafiks
clc, clearvars, format compact, close all

f = @(x) (2 + log(1 + 2*x.^3)) .* (2 + sin(x + 2));
a = 3;
b = 11;
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

x_pr = linspace(a, b, 500);
y_polyn = double(polyn(x_pr));
y_exact = f(x_pr);

figure('Position', [100, 100, 800, 600])
plot(x_pr, y_exact, 'k-', 'LineWidth', 2, 'DisplayName', 'f(x)')
hold on
plot(x_pr, y_polyn, 'r-', 'LineWidth', 2, 'DisplayName', 'Nūtona polinoms')
plot(xnodes, ynodes, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'blue', 'DisplayName', 'Interpolācijas mezgli')
grid on
title('Nūtona interpolācijas polinoma grafiks')
xlabel('x')
ylabel('y')
legend('Location', 'best')
xlim([a, b])

%% 3. uzdevums. Ņūtona polinoma un splaina salīdzinājums
clc, clearvars, format compact

f = @(x) log(cos(5 + x) + (2 + 0.3*x).^2) .* log(4 + 2*x + x.^3);

a = 5;
b = 10;
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

x1 = 7.33;
p_x1 = double(polyn(x1));
spl_x1 = interp1(xnodes, ynodes, x1, 'spline');
result = abs(p_x1 - spl_x1);
fprintf('%.4f\n', result);

%% 4. uzdevums. Pirmās kārtas izdalītā starpība
clc, clearvars, format compact

f = @(x) (x.^3).^(1/4) + 2*cos(x);

a = 5;
b = 11;
delta_x = 1;

xnodes = a:delta_x:b;
ynodes = f(xnodes);

f_x2_x3 = (ynodes(4) - ynodes(3)) / (xnodes(4) - xnodes(3));
fprintf('%.4f\n', f_x2_x3);

%% 5. uzdevums. Ņūtona interpolācijas polinoma vērtība
clc, clearvars, format compact

f = @(x) (cos(1 + x.^(1/3) + log(x)) + 4*x) .* log(3 + 4*x.^3);

a = 2;
b = 6;
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
x0 = 3.43;
result = double(polyn(x0));
fprintf('%.4f\n', result);
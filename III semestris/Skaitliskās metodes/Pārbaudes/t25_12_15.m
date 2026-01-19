%% 1. uzdevums
clc, clearvars, format compact

dy_dx = @(x,y)[y .* log(y) + cos(x)/sqrt(1+x.^2)];
y1 = 5;

risinajuma_intervals = [1 4];
risinajums = ode45(dy_dx, risinajuma_intervals, y1);

y_prime_for_1_34 = deval(risinajums, 1.34);
fprintf("Atbilde: %.4f\n", y_prime_for_1_34);

%% 2. uzdevums
clc, clearvars, format compact

dy_dx = @(x,y)[
    y(2)
    (sin(2.*x) - x.*y(1) - (x.^3+1).*y(2)) ./ (4.+x)
];

y_4 = [3 0];

risinajuma_intervals = [4 9];
risinajums = ode45(dy_dx, risinajuma_intervals, y_4);

y_prime_for_8_74 = deval(risinajums, 8.74);
fprintf("Atbilde: %.4f\n", y_prime_for_8_74(2));

%% 3. uzdevums
clc, clearvars, format compact

% y = \sin(x+5) + \cos(x+1)\cdot\sqrt{x+19} - 0,\!7x
% y^\prime = \cos(x+5) + (\cos(x+1)\cdot(x+19)^{0,5})^\prime = \\
% = \cos(x+5) - \sin(x+1)\cdot\sqrt{x+19} + \cos(x+1)\cdot(x+19)^{-0,5}

f = @(x)(sin(x+5) + cos(x+1).*sqrt(x+19) - 0.7.*x);

deriv = @(x)(cos(x+5) - sin(x+1).*sqrt(x+19) + cos(x+1).*(x+19).^(-0.5));

x = 0;
precizitate = 10e-4;

while true
    x_new = x - deriv(x)\f(x);
    if norm(x_new - x) < precizitate
        break
    end
    x = x_new;
end

fprintf("x = %.4f\n", x_new)

%% 4. uzdevums
clc, clearvars, format compact

f = @(x)[
    sin(x(2)-2) - 3.*x(1) + 2
    2.*x(2) - cos(3.*x(1) + 7) - 5
];

deriv = @(x)[
    -3,               cos(x(2) - 2)
    3*sin(3.*x(1)+7), 2
];

x = [0; 5];
precizitate = 10e-7;

while true
    x_new = x - deriv(x)\f(x);
    if norm(x_new - x) < precizitate
        break
    end
    x = x_new;
end

fprintf("x_2 = %.3f\n", x_new(2))
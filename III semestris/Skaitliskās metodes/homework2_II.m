%% 1 uzd                   %%IT
clc, clearvars, format compact

A = [9.1, 4.5, -3, -1.2;
     -4, 8.3, 2, 1.5;
     3, -2, 10, -4.4;
     4.3, -1.2, -1, 6.9];
 
B = [-4.2; -3.3; 2; 6];

X = [0; 0; 0; 0];
n = length(B);

X_exact = linsolve(A, B);

fprintf('X = [%.6f, %.6f, %.6f, %.6f]ᵀ\n', X_exact);

X_history = zeros(n, 11);
X_history(:, 1) = X;

fprintf('Iterācija %d: X = [%.6f, %.6f, %.6f, %.6f]ᵀ\n', 0, X);

for iter = 1:10
    X_new = zeros(n,1);
    for i = 1:n
        sum_val = 0;
        for j = 1:n
            if j ~= i
                sum_val = sum_val + A(i,j) * X(j);
            end
        end
        X_new(i) = (B(i) - sum_val) / A(i,i);
    end
    
    X_history(:, iter+1) = X_new;
    X = X_new;
    fprintf('Iterācija %d: X = [%.6f, %.6f, %.6f, %.6f]ᵀ\n', iter, X);
end

difference = X_exact - X_history(:, 11);
difference_norm = norm(difference, 2);

fprintf('\n Rezultāti: \n');
fprintf('Precīzs risinājums X = [%.6f, %.6f, %.6f, %.6f]ᵀ\n', X_exact);
fprintf('Jakobi tuvinājums X⁽¹⁰⁾ = [%.6f, %.6f, %.6f, %.6f]ᵀ\n', X_history(:, 11));
fprintf('Starpība X - X⁽¹⁰⁾ = [%.6f, %.6f, %.6f, %.6f]ᵀ\n', difference);
fprintf('||X - X⁽¹⁰⁾||₂ = %.6f\n', difference_norm);

fprintf('\n ATBILDE: \n');
fprintf('||X - X⁽¹⁰⁾||₂ = %.4f\n', difference_norm);

%% 2uzd                   %%IT
clc, clearvars, format compact

A = [-7.4, -1.8, 2, 0.5;
     -1.2, 8.3, -4.2, 2;
     2.8, -3, 10, -3.4;
     -2, 3.6, 1, 8.4];
 
B = [5.2; -2.3; 2; -5.5];

X = [1; 0; 1; 2];
n = length(B);

fprintf('Iterācija %d: X = [%.6f, %.6f, %.6f, %.6f]ᵀ\n', 0, X);
fprintf('                      x₄ = %.6f\n', X(4));

for iter = 1:8
    X_new = zeros(n,1);
    for i = 1:n
        sum_val = 0;
        for j = 1:n
            if j ~= i
                sum_val = sum_val + A(i,j) * X(j);
            end
        end
        X_new(i) = (B(i) - sum_val) / A(i,i);
    end
    
    X = X_new;
    fprintf('Iterācija %d: X = [%.6f, %.6f, %.6f, %.6f]ᵀ\n', iter, X);
    fprintf('                      x₄ = %.6f\n', X(4));
end

fprintf('\n REZULTĀTS: \n');
fprintf('x₄ pēc 8 iterācijām = %.6f\n', X(4));
fprintf('\n ATBILDE: \n');
fprintf('x₄ = %.4f\n', X(4));

%% 3uzd                   %%IT
clc, clearvars, format compact

A = [8.8, -3.4, -1.3, 1.2;
     -2.6, 8.3, 2.1, 1.7;
     -3, -2.9, 9.1, -2;
     2.3, -1.5, -1.8, 9.3];
 
B = [-4.2; -3.3; 2; 6];

X = [-1; -1; -2; 0];
n = length(B);

fprintf('Iterācija %d: X = [%.6f, %.6f, %.6f, %.6f]ᵀ\n', 0, X);
fprintf('||X⁽⁰⁾||₂ = %.6f\n', norm(X, 2));

for iter = 1:8
    X_new = zeros(n,1);
    for i = 1:n
        sum_val = 0;
        for j = 1:n
            if j ~= i
                sum_val = sum_val + A(i,j) * X(j);
            end
        end
        X_new(i) = (B(i) - sum_val) / A(i,i);
    end
    
    X = X_new;
    fprintf('Iterācija %d: X = [%.6f, %.6f, %.6f, %.6f]ᵀ\n', iter, X);
    fprintf('||X⁽%d⁾||₂ = %.6f\n', iter, norm(X, 2));
end

fprintf('\nREZULTĀTS \n');
fprintf('X⁽⁸⁾ = [%.6f, %.6f, %.6f, %.6f]ᵀ\n', X);
fprintf('||X⁽⁸⁾||₂ = %.6f\n', norm(X, 2));

fprintf('\nATBILDE \n');
fprintf('||X⁽⁸⁾||₂ = %.4f\n', norm(X, 2));

%% 4 uzd                   %%IT
clc, clearvars, format compact

n = 8;
a = -ones(1, n);
b = 2.5 * ones(1, n);
c = ones(1, n);
d = ones(n, 1);

a(1) = 0;
c(n) = 0;

ksi = zeros(1, n+1);
eta = zeros(1, n+1);
X = zeros(1, n);

for i = 1:n
    saucejs = b(i) - a(i) * ksi(i);
    ksi(i+1) = c(i) / saucejs;
    eta(i+1) = (a(i) * eta(i) - d(i)) / saucejs;
end

X(n) = eta(n+1);
for i = n-1:-1:1
    X(i) = ksi(i+1) * X(i+1) + eta(i+1);
end

fprintf('\nSistēmas risinājums \n');
for i = 1:n
    fprintf('X(%d) = %.6f\n', i, X(i));
end

fprintf('\nREZULTĀTS\n');
fprintf('x₅ = %.6f\n', X(5));

fprintf('\nATBILDE\n');
fprintf('x₅ = %.4f\n', X(5));

%% 5uzd                   %%IT
clc, clearvars, format compact

A = [5, 2, -1; -2, 6, 3; 2, -9, 12];
B = [-1; -5; 6];
X = [0; -1; 0];
n = length(B);

fprintf('Iterācija %d: X = [%.6f, %.6f, %.6f]ᵀ\n', 0, X);

for iter = 1:6
    X_new = zeros(n,1);
    for i = 1:n
        sum_val = 0;
        for j = 1:n
            if j ~= i
                sum_val = sum_val + A(i,j) * X(j);
            end
        end
        X_new(i) = (B(i) - sum_val) / A(i,i);
    end
    X = X_new;
    fprintf('Iterācija %d: X = [%.6f, %.6f, %.6f]ᵀ\n', iter, X);
end

x1 = X(1);
fprintf('\nx₁ = %.6f\n\n', x1);

y = @(x) (log(1 + x.^3) - sqrt(1 + x + x.^2)) ./ ...
         (atan(x.^2 + 4) - (cos(x).^2 + exp(sqrt(x))));

y_x1 = y(x1);

fprintf('ATBILDE:\n');
fprintf('y(x₁) = %.4f\n', y_x1);
%% 1uzd                   %%FM
clc, clearvars, format compact

n = 8;

a = ones(1, n);
b = 2.5 * ones(1, n);
c = ones(1, n);
d = ones(n, 1);
a(1) = 0;
c(n) = 0;

ksi = zeros(1, n+1);
eta = zeros(1, n+1);
X = zeros(1, n);

fprintf('=== Tiešā gaitā - ksi un eta aprēķins ===\n');
for i = 1:n
    saucejs = b(i) - a(i) * ksi(i);
    ksi(i+1) = c(i) / saucejs;
    eta(i+1) = (a(i) * eta(i) - d(i)) / saucejs;
    
    fprintf('i=%d: ksi(%d)=%.4f, eta(%d)=%.4f\n', ...
            i, i+1, ksi(i+1), i+1, eta(i+1));
end

fprintf('\n=== Reversā gaitā - risinājuma aprēķins ===\n');
X(n) = eta(n+1);
fprintf('X(%d) = eta(%d) = %.4f\n', n, n+1, X(n));

for i = n-1:-1:1
    X(i) = ksi(i+1) * X(i+1) + eta(i+1);
    fprintf('X(%d) = ksi(%d)*X(%d) + eta(%d) = %.4f*%.4f + %.4f = %.4f\n', ...
            i, i+1, i+1, i+1, ksi(i+1), X(i+1), eta(i+1), X(i));
end

fprintf('\n=== Galīgais risinājums ===\n');
for i = 1:n
    fprintf('X(%d) = %.6f\n', i, X(i));
end

fprintf('\n=== Stabilitātes pārbaude ===\n');
is_stable = true;
for i = 1:n
    if abs(b(i)) < (abs(a(i)) + abs(c(i)))
        fprintf('i=%d: |b_i| = %.1f < |a_i| + |c_i| = %.1f + %.1f = %.1f - NAV STABILS!\n', ...
                i, abs(b(i)), abs(a(i)), abs(c(i)), abs(a(i)) + abs(c(i)));
        is_stable = false;
        break;
    else
        fprintf('i=%d: |b_i| = %.1f ≥ |a_i| + |c_i| = %.1f + %.1f = %.1f - stabils\n', ...
                i, abs(b(i)), abs(a(i)), abs(c(i)), abs(a(i)) + abs(c(i)));
    end
end

if is_stable
    fprintf('\n=== REZULTĀTS: Faktorizācijas metode IR STABILA ===\n');
else
    fprintf('\n=== REZULTĀTS: Faktorizācijas metode NAV STABILA ===\n');
end

fprintf('\n=== Risinājuma pārbaude ===\n');
for i = 1:n
    if i == 1
        kreisa_puse = -b(i)*X(i) + c(i)*X(i+1);
    elseif i == n
        kreisa_puse = a(i)*X(i-1) - b(i)*X(i);
    else
        kreisa_puse = a(i)*X(i-1) - b(i)*X(i) + c(i)*X(i+1);
    end
    
    fprintf('Vienādojums %d: kreisā puse = %.6f, labā puse = %.1f, starpība = %.6f\n', ...
            i, kreisa_puse, d(i), abs(kreisa_puse - d(i)));
end

%% 2uzd                   %%FM
clc, clearvars, format compact

a = [0, 1, 2, 3, 4, 5];
b = [7, 7, 7, 7, 7, 7];
c = [5, 4, 3, 2, 1, 0];
d = [1, 2, 3, 4, 5, 6];

n = length(a);

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

fprintf('=== Sistēmas risinājums ===\n');
for i = 1:n
    fprintf('X(%d) = %.6f\n', i, X(i));
end

x5 = X(5);
fprintf('\nX5 = %.6f\n', x5);

x = x5;
f_x5 = (1 + sqrt(x) - atan(3*x)^2) / (2 + 5*x + sqrt(3) + cos(2*x) + x^2);

fprintf('\n=== f(X5) aprēķins ===\n');
fprintf('f(%.6f) = (1 + √%.6f - arctg²(3×%.6f)) / (2 + 5×%.6f + √3 + cos(2×%.6f) + (%.6f)²)\n', ...
        x5, x5, x5, x5, x5, x5);
fprintf('f(X5) = %.6f\n', f_x5);
fprintf('f(X5) = %.4f\n', f_x5);

%% 3uzd
clc, clearvars, format compact

v = [-0.8, 1.7, 2.3, 6, 8, -3, -2, 5];

norm_v4 = norm(v, 4);

fprintf('Vektors v = [');
fprintf('%.1f ', v);
fprintf(']\n\n');

fprintf('L4 norma aprēķins:\n');
fprintf('||v||₄ = (Σ|vᵢ|⁴)¹ᐟ⁴\n');

fprintf('\n|vᵢ|⁴ vērtības:\n');
for i = 1:length(v)
    fprintf('|%.1f|⁴ = %.4f\n', v(i), abs(v(i))^4);
end

fprintf('\nSumma = %.4f\n', sum(abs(v).^4));
fprintf('||v||₄ = (%.4f)¹ᐟ⁴ = %.4f\n', sum(abs(v).^4), norm_v4);

fprintf('\n=== ATBILDE ===\n');
fprintf('||v||₄ = %.4f\n', norm_v4);

%% 4uzd                   %%JA
clc, clearvars, format compact

A = [-8.2, 3, -3, 1;
     4, -9.3, 1.2, -3;
     -2, -4.3, 12, 1.5;
     -1, -2.2, -3, 7];
 
B = [5.2; -2.3; 2; -5.5];

X0 = [0; -1; 1; -1];
n = length(B);

fprintf('=== Konverģences pārbaude ===\n');
is_convergent = true;
for i = 1:n
    row_sum = sum(abs(A(i,:))) - abs(A(i,i));
    if abs(A(i,i)) <= row_sum
        fprintf('i=%d: |a_ii| = %.1f <= Σ|a_ij| = %.1f - NAV STABILS!\n', ...
                i, abs(A(i,i)), row_sum);
        is_convergent = false;
    else
        fprintf('i=%d: |a_ii| = %.1f > Σ|a_ij| = %.1f - stabils\n', ...
                i, abs(A(i,i)), row_sum);
    end
end

if is_convergent
    fprintf('Jakobi metode KONVERĢE\n\n');
else
    fprintf('Jakobi metode VAR NEEKONVERĢE\n\n');
end

X = X0;
fprintf('=== Jakobi metode - 5 iteracijas ===\n');
fprintf('Iterācija %d: X = [%.6f, %.6f, %.6f, %.6f]ᵀ\n', 0, X);

for iter = 1:5
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
end

residual = B - A * X;
residual_norm = norm(residual, 2);

fprintf('\n=== Rezultāti pēc 5 iterācijām ===\n');
fprintf('X⁽⁵⁾ = [%.6f, %.6f, %.6f, %.6f]ᵀ\n', X);
fprintf('B - AX⁽⁵⁾ = [%.6f, %.6f, %.6f, %.6f]ᵀ\n', residual);
fprintf('||B - AX⁽⁵⁾||₂ = %.6f\n', residual_norm);

fprintf('\n=== ATBILDE ===\n');
fprintf('||B - AX⁽⁵⁾||₂ = %.4f\n', residual_norm);

%% 5 uzd                   %%JA
clc, clearvars, format compact

A = [5, 2, -1;
     -2, 6, 3;
     2, -9, 12];
 
B = [-1; -5; 6];

X = [0; -1; 0];
n = length(B);

X_history = zeros(n, 7);
X_history(:, 1) = X;

fprintf('=== Jakobi metode - 6 iteracijas ===\n');
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
    
    X_history(:, iter+1) = X_new;
    X = X_new;
    fprintf('Iterācija %d: X = [%.6f, %.6f, %.6f]ᵀ\n', iter, X);
end

error_6 = X_history(:, 7) - X_history(:, 6); % ε⁽⁶⁾ = X⁽⁶⁾ - X⁽⁵⁾
error_norm = norm(error_6, 2);

fprintf('\n=== Rezultāti ===\n');
fprintf('X⁽⁵⁾ = [%.6f, %.6f, %.6f]ᵀ\n', X_history(:, 6));
fprintf('X⁽⁶⁾ = [%.6f, %.6f, %.6f]ᵀ\n', X_history(:, 7));
fprintf('ε⁽⁶⁾ = X⁽⁶⁾ - X⁽⁵⁾ = [%.6f, %.6f, %.6f]ᵀ\n', error_6);
fprintf('||ε⁽⁶⁾||₂ = %.6f\n', error_norm);

fprintf('\n=== ATBILDE ===\n');
fprintf('||ε⁽⁶⁾||₂ = %.4f\n', error_norm);
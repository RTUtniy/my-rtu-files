%% 2.6. Iterāciju metode
clc, clearvars, format compact
A=[9,2,5;
   2,18,6;
   5,6,27];

B = [1;
    6;
    2];

x_app = transpose([0,0,0]); % sistēmas sākuma tuvinājums
tau = 0.01;
epsilon = 10^(-3);
max_iter = 12 % iterāciju skaits

%||x^{(12)}||_2 = ? tuvinātā atrisinājuma norma
%||B-Ax^{(12)}||2 = ? nesaistes norma

isSingular(A);
cmc(A);
if isSimetric(A)==0
    disp('Koeficientu matrica nav simetriska')
    disp('Atbilde: vienkāršo iterāciju metodi nedrīkst izmantot')
    return
else
    disp('Koeficientu matrica ir simetriska un pozitīvi definēta')
end

k_iter = 0;
resid = B - A*x_app;
while norm(resid) > epsilon && k_iter < max_iter
    x_app = x_app + (tau * resid);
    resid = B - (A * x_app);
    k_iter = k_iter + 1;
end
k_iter, x_app, x_sol = linsolve(A,B)

disp('Atbilde:')
fprintf('  iterāciju skaits = %d\n', k_iter)
fprintf('  x tuvinājumi = { %.4f, %.4f, %.4f }\n', x_app(1), x_app(2), x_app(3))
fprintf('  tuvinātā atr. norma 12. iter. = %.4f\n', norm(x_app))
fprintf('  nesaistes norma 12. iter. = %.4f\n', norm(resid))

%% 2.7. Iterāciju metode
clc, clearvars, format compact
A = [9, 2, 5;
     2, 18, 6;
     5, 6, 27];

B = [1;
     6;
     2];

x_app = transpose([0,0,0]); % sistēmas sākuma tuvinājums
lambda_max = eigs(A, 1)
tau_max = 2/lambda_max
epsilon = 10^(-3);
max_iter = 15 % iterāciju skaits

tau = tau_max

isSingular(A);
cmc(A);
if isSimetric(A)==0
    disp('Koeficientu matrica nav simetriska')
    disp('Atbilde: vienkāršo iterāciju metodi nedrīkst izmantot')
    return
else
    disp('Koeficientu matrica ir simetriska un pozitīvi definēta')
end

k_iter = 0;
resid = B - A*x_app;
while norm(resid) > epsilon && k_iter < max_iter
    x_app = x_app + (tau * resid);
    resid = B - (A * x_app);
    k_iter = k_iter + 1;
end
k_iter, x_app, x_sol = linsolve(A,B)

disp('Atbilde:')
fprintf('  iterāciju skaits = %d\n', k_iter)
fprintf('  tau_max = %.6f\n', tau_max)
fprintf('  x tuvinājumi = { %.4f, %.4f, %.4f }\n', x_app(1), x_app(2), x_app(3))
fprintf('  tuvinātā atr. norma 15. iter. = %.4f\n', norm(x_app))
fprintf('  nesaistes norma 15. iter. = %.4f\n', norm(resid))
%% 2.8. Iterāciju metode
clc, clearvars, format compact

A = [9, 2, 5;
     2, 18, 6;
     5, 6, 27];

B = [1;
    6;
    2];

x_app = transpose([0,0,0]); % sistēmas sākuma tuvinājums
lambda = eig(A);
tau_opt = 2/(max(lambda)+min(lambda));
epsilon = 10^(-3);
max_iter = 10 % iterāciju skaits

tau = tau_opt

isSingular(A);
cmc(A);
if isSimetric(A)==0
    disp('Koeficientu matrica nav simetriska')
    disp('Atbilde: vienkāršo iterāciju metodi nedrīkst izmantot')
    return
else
    disp('Koeficientu matrica ir simetriska un pozitīvi definēta')
end

k_iter = 0;
resid = B - A*x_app;
while norm(resid) > epsilon && k_iter < max_iter
    x_app = x_app + (tau * resid);
    resid = B - (A * x_app);
    k_iter = k_iter + 1;
end
k_iter, x_app, x_sol = linsolve(A,B)

disp('Atbilde:')
fprintf('  iterāciju skaits = %d\n', k_iter)
fprintf('  tau_opt = %.6f\n', tau_opt)
fprintf('  x tuvinājumi = { %.4f, %.4f, %.4f }\n', x_app(1), x_app(2), x_app(3))
fprintf('  tuvinātā atr. norma %d. iter. = %.4f\n', k_iter, norm(x_app))
fprintf('  nesaistes norma %d. iter. = %.4f\n', k_iter, norm(resid))
%% 2.9. Atrast >> īpašvērtību
clc, clearvars, format compact

A = [1 4 7 -1 5;
    8 2 -3 4 10;
    6 12 -2 7 4;
    3 -4 9 0 11;
    5 6 -4 2 8];
epsilon = .001;

[~, D] = eig(A);
[row,~] = size(D);
eig_val_max = abs(real(D(1, 1)));
for dindex = 1:row
    if eig_val_max < abs(real(D(dindex, dindex)))
        eig_val_max = abs(real(D(dindex, dindex)))
    end
end

eig_val_max
%nepareizs

%% 2.10.

%% 2.11.

%% 2.12.

%% 2.13.

%% 2.14.

%% Papildus funkcijas
function isSingular(matrix)
    if det(matrix) == 0
        disp('Dotā matrica ir singulāra');
        return;
    else
        disp('Dotā matrica nav singulāra');
        return;
    end
end

function ni = cmc(A_mat) % koef. matricas pārbaude
   ni = 1;  % Koeficientu matrica ir pozitīvi definēta
   [row,~] = size(A_mat);
   for i = 1:row
      if det(A_mat(1:i,1:i)) > 0
        %
      else
          ni = 2; % Koeficientu matrica nav pozitīvi definēta
          break
      end
   end
end

function bool = isSimetric(matrix)
    bool = isequal(matrix, matrix');
    return
end
%% 1. uzdevums                   %%VI
clc, clearvars, format compact
A=[7.3,2,3.2,8.5;
   2,9.5,14,1.9;
   3.2,14,85,4;
   8.5,1.9,4,28];

B = [-4.7;
    -2.2;
    3.6;
    7.8];

syms x_1 x_2 x_3 x_4;
x_app = [x_1;x_2;x_3;x_4];
lambda = eig(A);
tau_opt = 2/(max(lambda)+min(lambda));

isSingular(A);
cmc(A);
if isSimetric(A)==0
    disp('Koeficientu matrica nav simetriska')
    disp('Atbilde: vienkāršo iterāciju metodi nedrīkst izmantot')
    return
else
    disp('Koeficientu matrica ir simetriska un pozitīvi definēta')
end

fprintf('Atbilde: tau=%.4f\n', tau_opt)
%% 2. uzdevums                   %%MN
clc, clearvars, format compact
A = [5.3, 6.4, 8;
     6.4, 25.3, 4.6;
     8, 4.6, 31];

B = [-1.5;
     -2.6;
     -3.7];
syms x_1 x_2 x_3 x_4;
X = [x_1;x_2;x_3;x_4];
x_app = transpose([-1 1 0]);

cmc(A);
if isSimetric(A)==0
    disp('Koeficientu matrica nav simetriska')
    disp('Atbilde: minimālās nesaistes metodi nedrīkst izmantot')
    return
else
    disp('Koeficientu matrica ir simetriska un pozitīvi definēta')
end

k_iter = 0;
epsilon = 10^(-3);
max_iter = 28;
r = A * x_app - B;
norm_r = norm(r);
while norm_r > epsilon && k_iter < max_iter
    k_iter = k_iter + 1;
    tau = ((A*r)'*r)/norm(A*r)^2;
    x_app = x_app-(tau*r')';
    r = A*x_app-B;
    norm_r = norm(r);
end

fprintf('Atbilde: x_3=%.4f\n', x_app(3))
%% 3. uzdevums                   %%VI
clc, clearvars, format compact

A = [3 1 9 6;
    1 10 7 8;
    9 7 100 13;
    6 8 13 20];

B = [-3;
     -2.5;
     4.7;
     -3.3];

syms x_1 x_2 x_3 x_4;
X = [x_1;x_2;x_3;x_4];
x_app = [0;0;0;0];
tau = 0.015;
epsilon = 10^(-3);
max_iter = 6;

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

fprintf('Atbilde: tuvinātā atr. norma %d. iter. = %.4f\n', k_iter, norm(x_app))

%% 4. uzdevums                   %%VI
clc, clearvars, format compact

A = [8.5 9.3 12;
    9.3 64 10.7;
    12 10.7 73];

B = [-1.5; -2.6; -3.7];

x_app = [1;-1;2];

k_iter = 0;
epsilon = 10^(-3);
max_iter = 25;
r = A * x_app - B;
norm_r = norm(r);
while norm_r > epsilon && k_iter < max_iter
    k_iter = k_iter + 1;
    tau = ((A*r)'*r)/norm(A*r)^2;
    x_app = x_app-(tau*r')';
    r = A*x_app-B;
    norm_r = norm(r);
end

X_S = linsolve(A,B);
norma = norm(X_S - X_app)

fprintf('Atbilde: x_3=%.4f\n', x_app(3))
%% 5. uzdevums                   %%VI
clc, clearvars, format compact

A = [7.2 1 3.3 8;
    1 9 13 2;
    3.3 13 84 4.4;
    8 2 4.4 30];

B = [-2.5;
     3.3;
     -7.7;
     8.6];

X_app = [0;0;0;0];

lambda = eig(A);
tau_opt = 2/(max(lambda)+min(lambda));
tau = tau_opt;
epsilon = 10^(-3);
max_iter = 19;

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
resid = B - A*X_app;
while norm(resid) > epsilon && k_iter < max_iter
    X_app = X_app + (tau * resid);
    resid = B - (A * X_app);
    k_iter = k_iter + 1;
end

X_S = linsolve(A,B);
norma = norm(X_S - X_app);

fprintf('Atbilde: norma starp risinājumiem = %.4f\n', norma);

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

function ni = fun_prob10(A_mat)
 ni = 1;
 [row,col] = size(A_mat);
 for i = 1:row
 if det(A_mat(1:i,1:i))>0
 else ni = 2; break
 end
 end
end
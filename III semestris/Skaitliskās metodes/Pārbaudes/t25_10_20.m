%% 1. uzdevums
clc, clearvars, format short

A = [1 -3 2 1
    4 -3 1 0
    5 1 4 2];

B = [3; 7; 2];

Aaug = [A B];
sol = sym(rref(Aaug));

syms x_4, X_gen = sol(:,4)-sol(:,3).*x_4

%% 2. uzdevums
clc, clearvars, format short

A = [2 1 1 4
    3 2 -1 5
    1 2 8 6];

B = [-1; 3; -4];

[row,col] = size(A);
Aaug = [A B];
A_rank = rank(A);
Aaug_rank = rank(Aaug);
sol = sym(rref(Aaug));

syms x_4

X_gen = sol(:,5)-sol(:,4).*x_4;
X_part = subs(X_gen, x_4, 5);
x_1 = X_part(1)

%% 3. uzdevums
clc, clearvars, format short

A = [3 1 2
    4 2 7
    1 3 6];

B = [2; 3; 7];

x_app = [0;0;0];

iter = 0;
itermax = 9;
epsi = 0.001;
errnorm = 1;

while errnorm > epsi && iter < itermax 
    iter  = iter+1;
    for rowIndex = 1:3
      res_sum = 0;
      for columnIndex = 1:3
         if columnIndex~=rowIndex
           res_sum =res_sum+x_app(columnIndex,iter)*A(rowIndex,columnIndex);
         end
      end
      x_app(rowIndex,iter+1) = (B(rowIndex,1)-res_sum)/A(rowIndex,rowIndex);
    end
end

fprintf(' Atbilde: ||epsilon^(7)||_2 = %.4f\n' ,norm(x_app(:,6)-x_app(:,7)))

%% 4. uzdevums
clc, clearvars, format short

A = [-7 3 4
    -6 9 2
    4 -4 7];

B = [4; 5; 8];

x_app = zeros(size(B));

iter = 0;
itermax = 9;
epsi = 0.001;
errnorm = 1;
prnorm = zeros(1,2);

while errnorm > epsi && iter < itermax 
    iter  = iter+1;
    for rowIndex = 1:3
      res_sum = 0;
      for columnIndex = 1:3
         if columnIndex~=rowIndex
           res_sum =res_sum+x_app(columnIndex,iter)*A(rowIndex,columnIndex);
         end
      end
      x_app(rowIndex,iter+1) = (B(rowIndex,1)-res_sum)/A(rowIndex,rowIndex);
    end
end
x_res = linsolve(A, B);
fprintf(' Atbilde: ||X-X^(9)||_2 = %.4f\n' , norm(x_res(:)-x_app(:,9)))

%% 5. uzdevums
clc, clearvars, format short

A = [6 5 9 11
    5 13 12 4
    9 12 169 10
    11 4 10 39];

B = [5; 2; 3; -1];

lambda = eig(A);
tau_min = 2/(max(lambda)+min(lambda))

% well, es zinu ka tas nav pareizi (tas ir optimālais tau),
% bet es vismaz mēģināju

%% 6. uzdevums
clc, clearvars, format short

A = [6 5 9 11
    5 13 12 4
    9 12 169 10
    11 4 10 39];

B = [1; 1; 4; 9];

x_app = [0;0;0;0];
tau = 0.02;
epsilon = 10^(-3);
max_iter = 7;

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

fprintf('||X^(7)||_2 = %.4f\n', norm(x_app))

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
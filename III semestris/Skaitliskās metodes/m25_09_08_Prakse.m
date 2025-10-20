%% Lineāru vienādojumu sistēmas. Tiešās metodes 
% 7.-39.lpp.

%% Visu uzdevumu numerācija sakrīt ar uzdevumu numerāciju
% mācību grāmatā V.Koliškina, A.Koliškins. 
% Skaitliskās metodes ar Matlab. RTU izdevniecība, 2023.

%% Gausa metode: 7.-16.lpp.

%% 1.1. uzdevums                   %%GA
clc, clearvars, format compact 
A = [3,-1,4;2,3,1;1,-5,-3];
B = [-3;5;3];
[row,col] = size(A)
Aaug = [A B];          % divu matricu apvienojums
A_rank = rank(A)       % matricas rangs
Aaug_rank = rank(Aaug) % paplašinātās matricas rangs
sol = rref(Aaug)       % Ctrl+Enter

% turpinājums
X_name = ['x1';'x2';'x3'];
X_value = sol(:,col+1);
disp('Atbilde:')
disp(' LVS ir saderīga un noteikta,tai ir viens vienīgs atrisinājums')
solution = table(X_name,X_value)

%% 1.2. uzdevums                   %%GA
clc, clearvars, format compact 
A = [3, -1, 4;
     2,  3, 1;
     7,  5, 6];
B = [-1; 1; 1];
Aaug=[A B];
[row,col] = size(A);
A_rank = rank(A)
Aaug_rank = rank(Aaug) 
sol = sym(rref(Aaug))  % Ctrl+Enter

% turpinājums 
syms z, X_gen = sol(:,4)-sol(:,3).*z   % Ctrl+Enter

% turpinājums
disp('Atbilde:')
disp(' LVS ir saderīga un nenoteikta (bezgalīgi daudz atrisinājumu)')
fprintf('x = %s, y = %s; \n', X_gen(1:2))
fprintf('z - jebkurš reāls skaitlis\n')

%% 1.3. uzdevums                   %%GA
clc, clearvars, format compact 
A = [3, -3,  3, 6;
     3,  6, -3, 7;
     3, -9,  3, 1];
B = [6; 1; 7];
Aaug=[A B];
[row,col] = size(A);
A_rank = rank(A)
Aaug_rank = rank(Aaug) 
sol = sym(rref(Aaug))  % Ctrl+Enter

% turpinājums 
syms x4
X_gen = sol(:,5)-sol(:,4).*x4   % Ctrl+Enter
X_part = subs(X_gen, x4, -2)
x1_ver = X_part(1)

% turpinājums
disp('Atbilde:')
disp(' LVS ir saderīga un nenoteikta (bezgalīgi daudz atrisinājumu)')
fprintf('x1 = %s, x2 = %s, x3=%s; \n', X_gen(1:3))
fprintf('x4 - jebkurš reāls skaitlis\n\n')
fprintf('x1 = %s\n', x1_ver)

%% 1.4. uzdevums                   %%GA
clc, clearvars, format compact 
A = [1, 2,  1, -3;
     2, 1, -2,  9;
     3, 3, -1,  6;
     4, 5,  0,  3];
B = [5; -2; 3; 8];
Aaug=[A B];
[row,col] = size(A);
A_rank = rank(A)
Aaug_rank = rank(Aaug) 
sol = sym(rref(Aaug))  % Ctrl+Enter

% turpinājums 
syms x3 x4
X_gen = sol(:,5)-sol(:,4).*x4-sol(:,3).*x3   % Ctrl+Enter
X_part = subs(subs(X_gen, x3, -1), x4, 3)
x2_ver = X_part(2)

% turpinājums
disp('Atbilde:')
disp(' LVS ir saderīga un nenoteikta (bezgalīgi daudz atrisinājumu)')
fprintf('x1 = %s, x2 = %s; \n', X_gen(1:2))
fprintf('x3 un x4 - jebkuri reāli skaitļi\n\n')
fprintf('x2 = %s\n', x2_ver)

%% 1.9. uzd                   %%GA
clc, clearvars, format compact 
A = [0,  1,  2, -1;
     2, -3,  2,  0;
     2, -4,  0,  1;
    -2 , 5, -3,  3];
B = [2; -2; 3; 1];
Aaug=[A B];
[B_rindas, B_kolonnas] = size(B);
A_rank = rank(A)
Aaug_rank = rank(Aaug)
sol = sym(rref(Aaug))  % Ctrl+Enter

if Aaug_rank ~= A_rank
    fprintf('Atbilde:\n LVS ir nesaderīga (nav atrsinājuma)\n')
end

%% 1.10. uzd                   %%GA
clc, clearvars, format compact 
A = [1, 1, 1,  1, 1;
     1, 2, 2,  4, 2;
     1, 2, 3, -1, 3];
B = [3; 5; 6];
Aaug=[A B];
A_rank = rank(A)
Aaug_rank = rank(Aaug) 
sol = sym(rref(Aaug))  % Ctrl+Enter

% turpinājums 
syms x4 x5
X_gen = sol(:,6)-sol(:,5).*x5-sol(:,4).*x4   % Ctrl+Enter
X_part = subs(subs(X_gen, x4, -2), x5, -1)
x3_ver = X_part(3)

disp('Atbilde:')
disp(' LVS ir saderīga un nenoteikta (bezgalīgi daudz atrisinājumu)')
fprintf(' x1 = %s, x2 = %s, x3 = %s; \n', X_gen(1:3))
fprintf(' kur x4 un x5 - jebkuri reāli skaitļi\n\n')
fprintf('x3 = %s\n', x3_ver)
%% 1. uzdevums
clc, clearvars, close all

A = [1 -2  4;
     2  0 -5;
     4  1  3];
B = [3  0 1;
    -6  4 2;
     1 -7 5];
 
atbilde_decimalsk = A*transpose(B)+A^-1*B+2*eye(3)
atbilde_precizi = sym(atbilde_decimalsk)

%% 2. uzdevums
clc, clearvars, close all
A = [1  2 -2  5;
     3 -1 -5  4;
     4 -3  0 -6;
     2 -3 -3 -1];

B = [2; 4; 5; 2];

P = [A B];

P_rangs = rank(P);
A_rangs = rank(A);
[B_rindas, B_kolonnas] = size(B);

if P_rangs == A_rangs
    % LVS ir saderīga
    
    if B_rindas == P_rangs
        % LVS ir noteikta
        
        X = A^-1*B;
        disp(['(' num2str(X(1,1)) '; ' num2str(X(2,1)) '; ' num2str(X(3,1)) '; ' num2str(X(4,1)) ')'])
    else
        % LVS ir nenoteikta
        
        Gausa = rref(P);
        disp(['(' num2str(Gausa(1,5)) '; ' num2str(Gausa(2,5)) '; ' num2str(Gausa(3,5)) '; ' num2str(Gausa(4,5)) ')'])
    end
else
    % LVS nav saderīga
    
end

%% 3. uzdevums
clc, clearvars, close all
S = 0;
for n = 0:1:25
    S = S + (4*n+3)/(5*n-1);
end

disp(S)

%% 4. uzdevums
clc, clearvars, close all
A = [1  5 -2  3;
     7  4  6 -8;
     2 10  5 16;
     9 20 14 12];

% 1) pāra kolonnu elementu summa
a = 0;
[rindas, kolonnas] = size(A);
for i = 1:1:rindas
    for j = 2:2:kolonnas
        a = a + A(i, j);
    end
end
disp(a)

% 2) nepāra kolonnu elementu reizinājums
b = 1;
for i = 1:1:rindas
    for j = 1:2:kolonnas
        b = b * A(i, j);
    end
end
disp(b)

%% 5. uzdevums
clc, clearvars, close all

A = [1  5 -2  3;
     7  4  6 -8;
     2 10  5 16;
     9 20 14 12];
[rindas, kolonnas] = size(A);
B = zeros(rindas, kolonnas);

for i = 1:1:rindas
    for j = 1:1:kolonnas
        if i == j
            B(i, j) = A(i, j) * 3;
        else
            B(i, j) = A(i, j) + 10;
        end
    end
end
disp(B)
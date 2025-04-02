%% 4. nodarbība
%matricu definēšana

A = [1 2 3;3,-7,2
     5 8 7]
A32 = A(3,2)
A(3,3) = -6 % A_{3 2} 

invA = A^-1 % inversā matrica

E = eye(2)% vienības matrica

ATrans = A' % arī der % ATrans = transpose(A)

vieninieku = ones(2,3) % (1 1; 1 1; 1 1)
nullu = zeros (2,5) % (0 0; 0 0; 0 0; 0 0; 0 0)

% funkcijas matricām
[r,k] = size(nullu) % 2, 5
detA = det(A)  % determinants
rangsA = rank(A)

% matricu operācijas

A^2 % A*A
2*eye(3) % 2 * (1 1 1; 1 1 1; 1 1 1)
A.^2 % matricas elementu kāpināšana

%% 3. uzd.
clc, clearvars, format compact

A = [1, -3, 5;   -5, 2, 0;   4,  3, 1];
B = [1,  0, 3;   -2, 4, 5;   1, -7, 5];

C_dec = transpose(B)*A^2+A^-1*B+4*eye(3)

C_prec = sym(C_dec)

%% 4. uzd.
clc, clearvars, format compact

A = [-1  2 3  0  5;
      3 -1 4  3 -2;
      0  4 6 -7  9;
     -4  5 8 -9 10;
      0 -5 1  8 -8];
  
B = [A(1,1) A(1,2) A(1,3);
     A(2,1) A(2,2) A(2,3);
     A(3,1) A(3,2) A(3,3)]
 
C = [A(3,3) A(3,4) A(3,5);
     A(4,3) A(4,4) A(4,5);
     A(5,3) A(5,4) A(5,5)]
 
D_dec = 3*eye(3)-C^3*transpose(B)+transpose(C)*B^-1

D_prec = sym(D_dec)

%% 7. uzdevums
clc, clearvars, format compact

A = [3  3 -1;
     1 -1  1;
     3 -2  2];
B = [1; 0; -3];

Ap_rangs = rank([A B])
A_rangs = rank(A)
[rB, kB] = size(B)

if Ap_rangs == A_rangs
    disp('LVS ir saderīga')
    if rB == Ap_rangs
        disp('LVS ir noteikta')
        X = A^-1*B;
        disp(['Atbilde: x = ' num2str(X(1,1)) ', y = ' num2str(X(2,1)) ', z =' num2str(X(3,1))])
    else
        disp('LVS ir nenoteikta')
    end
else
    disp('LVS nav saderīga')
end

%% 9.
clc, clearvars, format compact

A = [
     2  1 3;
     3 -1 2;
    -1  2 1];

B = [4; 1; 3];

P = [A B];

Ap_rangs = rank([A B])
A_rangs = rank(A)
[rB, kB] = size(B)

Gausa = sym(rref(P))

if Ap_rangs == A_rangs
    disp('LVS ir saderīga')
    if rB == Ap_rangs
        disp('LVS ir noteikta')
        X = A^-1*B;
        disp(['Atbilde: x = ' num2str(X(1,1)) ', y = ' num2str(X(2,1)) ', z =' num2str(X(3,1))])
    else
        disp('LVS ir nenoteikta')
        X = A^-1*B
    end
else
    disp('LVS nav saderīga')
end

%% 12., 14.
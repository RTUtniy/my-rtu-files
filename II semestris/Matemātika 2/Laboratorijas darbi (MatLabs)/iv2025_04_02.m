%% for
clc, clearvars, format compact
A =[3 5 99 -67];
for i = 1 : 1 : length(A)
    disp(A(i))
end
disp("------")
for i = length(A) : -1 : 1
    disp(A(i))
end
disp("------")
for i = A
    disp(i)
end

%% 1. uzdevums
clc, clearvars, format compact

result = 1;
B = [-1 5 21 -11 35 -9 18];

for i = B
    result = result * i;
end
disp(result)

%% 2. uzdevums
clc, clearvars, format compact

A = [ 1  3  5  7;
      2  4  6  8;
     13 14 15 16;
      9 10 11 12];
[w,h] = size(A);

for i = 1:1:w
    for j = 1:1:h
        B(i, j) = A(i, j) + (j^2 + 2*j);
    end
end

disp(B)

%% 3. udzevums
clc, clearvars, format compact

A = [ 1  3  5  7;
      2  4  6  8;
     13 14 15 16;
      9 10 11 12];
[h,w] = size(A);

for i = 1:1:h
    for j = 1:1:w
        B(i, j) = (A(i, j))^2 + 3*i^3;
    end
end

disp(B)

%% 5. uzdevums
clc, clearvars

A = [3 9;
     5 4;
     7 2];
[h,w] = size(A);

for i = 1:1:h
    for j = 1:1:8
        A(i, j+2) = 2*(A(i, j)) - 3*A(i, j+1);
    end
end

disp(A)

%% 7. uzdevums
clc, clearvars

s = 0;
for i = 1:1:40
    if i <= 10 || i >= 30
        s = s + i^2 + 2*i;
    else 
        s = s + 3*i + 1;
    end
end
disp(s)

%% 8.uzdevums
clc, clearvars

A = [ 3 -3  2 -4  5;
     72 -2 11  7 -8;
      9 22 12 -2  5;
     -1 14 -6 10 -2];
[h,w] = size(A);
%% a)
clc, clear i j rez_a rez_b

rez_a = zeros(h, 1);
for i = 1:1:h
    for j = 1:1:w
        if (rem(i, 2) == 1) && A(i, j) > 0
            rez_a(i, 1) = rez_a(i, 1) + A(i,j);
        elseif (rem(i, 2) == 0) && A(i, j) < 0
            rez_a(i, 1) = rez_a(i, 1) + A(i,j);
        end
    end
end
disp(rez_a)
%% b)
clc, clear i j rez_a rez_b

rez_b = ones(2, 1);
for i = 1:1:h
    for j = 1:1:w
        if (rem(i, 2) == 1) && A(i, j) > 0
            rez_b(1, 1) = rez_b(1, 1) * A(i,j);
        elseif (rem(i, 2) == 0) && A(i, j) < 0
            rez_b(2, 1) = rez_b(2, 1) * A(i,j);
        end
    end
end
disp(rez_b)
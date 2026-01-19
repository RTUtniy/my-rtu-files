clc, clearvars, format compact
syms x y
% ieejas dati
x_prime = 5*x.^2 + 2*y.^2 + 2.*x.*y + 14.*x -8.*y + 3;
y_prime = x.^2/8 + y.^2/5 - 1;
% aprēķini
J = jacobian([x_prime, y_prime], [x, y]); % Jakobi matrica;

figure;
hold on; grid on;
fimplicit(@(x,y) 5*x.^2 + 2*x.*y + 2*y.^2 + 14*x - 8*y + 3, [-4 4 -4 4], 'b', 'LineWidth', 1.5);
fimplicit(@(x,y) x.^2/8 + y.^2/5 - 1, [-4 4 -4 4], 'r', 'LineWidth', 1.5);
xlabel('x'); ylabel('y');
title('Nekustīgo punktu grafiskā meklēšana');
legend("x' = 0", "y' = 0");

% No grafika var redzēt, ka M_1≈(0,25; 2,23) un M_2≈(-2,81; 0,24)
% (šajos punktos abas sistēmas izteiksmes ir vienādas ar 0, līdzsvara punkti
% apmierina šos gadījumus), šo punktu vērtībās tiks lietotas Jakobi matricā

M1 = [ 0.25 2.23];
M2 = [-2.81 0.24];
J1 = double(subs(J, {x, y}, {M1(1), M1(2)}));
J2 = double(subs(J, {x, y}, {M2(1), M2(2)}));

% Īpašvērtības
eigvalM1 = eig(J1);
eigvalM2 = eig(J2);

fprintf("Punkts M1 ir %s\n", determine_eigval_stability(eigvalM1))
fprintf("Punkts M2 ir %s\n", determine_eigval_stability(eigvalM2))
disp("Attiecīgi sistēma nav stabila")

function result = determine_eigval_stability(eigval)
    result = "asimptotiski stabils"; 
    % Ja visas matricas A īpašvērtības apmierina nosacījumu \alpha_r < 0
    % tad līdzsvara punkts x_* ir stabils un asimptotiski stabils.
    for i = 1:1:size(eigval,1)
        if real(eigval(i)) == 0
            result = 'stabils';
            % Triviālais sistēmas atrisinājums ir stabils, ja visas matricas A
            % īpašvērtības apmierina nosacījumu \alpha_r ≤ 0 un visas īpašvērtības,
            % kuriem \alpha_r = 0, ir vienkāršas. 
        elseif real(eigval(i)) > 0
            result = 'nestabils';
            % Ja vismaz viena no matricas A īpašvērtībām apmierina nosacījumu
            % \alpha_r > 0 tad līdzsvara punkts x_* ir nestabils.
            break
        end
    end
end
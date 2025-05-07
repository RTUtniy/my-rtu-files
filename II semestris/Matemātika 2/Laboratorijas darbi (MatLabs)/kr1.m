function [res] = kr1(vect)
%KR1 sareizina vektora elementus, kuriem daļveidā skaitītājs ir pāra
%skaitlis
%   Detailed explanation goes here
    res = 1;
    for i = 1:1:length(vect)
        [sk, ~] = numden(sym(vect(i)));
        disp(sk)
        if mod(sk, 2) == 0
            res = res * vect(i);
        end
    end
end


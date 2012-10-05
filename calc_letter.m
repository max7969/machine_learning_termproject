function letter = calc_letter(proba_letter,proba_diago,proba_hole,vect)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    holes = count_holes(vect);
    diagos = count_diago(vect);
    
    proba = 0;
    letter = 0;
    
    for i=1:26
        if proba < proba_diago(i,diagos+1)*proba_hole(i,holes+1)*proba_letter(i,1)
            letter = i-1;
            proba = proba_diago(i,diagos+1)*proba_hole(i,holes+1)*proba_letter(i,1);
        end
    end
end


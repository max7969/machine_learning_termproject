function [vect_res] = calc_proba_letter(data)
%Calc_proba_letter Return the probability for a letter to appear in the
%data set
%   input matrix [1,N]
    [height width] = size(data);
    vect_res = zeros(26,1);
    
    for i=1:height
        vect_res(data(i,1)+1) = vect_res(data(i,1)+1) + 1;
    end
    
    vect_res = vect_res/height;
end


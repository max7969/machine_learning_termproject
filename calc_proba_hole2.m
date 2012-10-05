function proba_letter_hole = calc_proba_hole2(train)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    [height width] = size(train);

    nb_hole = zeros(height,2);

    for i=1:height
        nb_hole(i,1) = train(i,1);
        nb_hole(i,2) = count_holes(train(i,:));
    end

    proba_letter_hole = zeros(26,21);
    
    for k=1:26
        cpt = 0;
        
        for i=0:20
            for j=1:height
                if nb_hole(j,2) == i && train(j,1) == (k-1)
                    cpt = cpt+1;
                    proba_letter_hole(k,i+1) = proba_letter_hole(k,i+1) + 1;
                end
            end
        end
        
        for i=0:20
            proba_letter_hole(k,i+1) = proba_letter_hole(k,i+1)/cpt;
        end
    end
    
end
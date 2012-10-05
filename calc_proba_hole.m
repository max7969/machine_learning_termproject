function proba_letter_hole = calc_proba_hole(train)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    [height width] = size(train);

    nb_hole = zeros(height,2);

    for i=1:height
        nb_hole(i,1) = train(i,1);
        nb_hole(i,2) = count_holes(train(i,:));
    end

    proba_letter_hole = zeros(26,21);

    for i=0:20
        cpt = 0;

        for j=1:height
            if nb_hole(j,2) == i
                cpt = cpt + 1;
                proba_letter_hole(nb_hole(j,1)+1,i+1) = proba_letter_hole(nb_hole(j,1)+1,i+1) + 1;
            end
        end

        for j=1:26
            proba_letter_hole(j,i+1) = proba_letter_hole(j,i+1)/cpt;
        end
    end
end


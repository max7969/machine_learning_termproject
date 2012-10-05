function proba_letter_diago = calc_proba_diag(train)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    [height width] = size(train);
    
    nb_diago = zeros(height,2);

    for i=1:height
        nb_diago(i,1) = train(i,1);
        nb_diago(i,2) = count_diago(train(i,:));
    end

    proba_letter_diago = zeros(26,71);

    for i=0:70
        cpt = 0;

        for j=1:height
            if nb_diago(j,2) == i
                cpt = cpt + 1;
                proba_letter_diago(nb_diago(j,1)+1,i+1) = proba_letter_diago(nb_diago(j,1)+1,i+1) + 1;
            end
        end

        for j=1:26
            proba_letter_diago(j,i+1) = proba_letter_diago(j,i+1)/cpt;
        end
    end
end


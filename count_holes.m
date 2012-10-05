function [nb_compo nb_dr_h] = count_holes(vect)
%Count Holes 
    image = ones(18,10);
    
    for j=2:129
        if vect(j) == 1
            vect(j) = 0;
        else 
            vect(j) = 1;
        end
    end
    
    for i=0:15
        image(i+2,2:9) = vect((i*8+2):(i*8+9));
    end
    
    compo = bwlabel(image,4);
    nb_compo = max(max(compo))-1;
end


function nb_compo = count_holes(vect)
%Count Holes 
    image = zeros(16,8);
    
    for j=2:129
        if vect(j) == 1
            vect(j) = 0;
        else 
            vect(j) = 1;
        end
    end
    
    for i=0:15
        image(i+1,:) = vect((i*8+2):(i*8+9));
    end
    
    test1 = bwlabel(image,4)
    test2 = bwlabel(image,8)
    nb_compo = image;
end


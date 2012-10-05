function count_diag = count_diago(vect)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    image = ones(16,8);
    
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
    
    cpt = 0;
    for i=1:12
        for j=1:4
            area = image(i:i+3,j:j+3);
            if area(1,1) == 0 && area(2,2) == 0 && area(4,4) == 0 && area(3,3) == 0
                cpt = cpt+1;
            end
            if area(4,1) == 0 && area(2,3) == 0 && area(3,2) == 0 && area(2,3) == 0
                cpt = cpt+1;
            end
        end
    end
    count_diag = cpt;
end


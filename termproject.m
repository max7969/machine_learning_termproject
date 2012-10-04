clear; clc;

train = load('train.txt');

[width height] = size(train);

nb_pixels = zeros(width,2);
coordo = zeros(width,3);

for i=1:width
    nb_pixels(i,1) = train(i,1);
    coordo(i,1) = train(i,1);
    
    count_px = 0;
    x_mean = 0;
    y_mean = 0;
    
    for j=2:height
        if train(i,j) == 1
            count_px = count_px + 1;
            x_mean = x_mean + mod(j-1,8);
            y_mean = y_mean + fix(j-1/8);
        end
    end
    
    coordo(i,2) = x_mean/count_px;
    coordo(i,3) = y_mean/count_px;
    nb_pixels(i,2) = count_px;
end

mean_nb_pixels = zeros(26,2);

mean_coordo = zeros(26,3);

for j=0:25
    sum = 0;
    sum_x = 0;
    sum_y = 0;
    count = 0;
    for i=1:width
        if nb_pixels(i,1) == j
            sum = sum + nb_pixels(i,2);
            sum_x = sum_x + coordo(i,2);
            sum_y = sum_y + coordo(i,3);
            count = count + 1;
        end

    end
    
    mean_nb_pixels(j+1,1) = j;
    mean_nb_pixels(j+1,2) = sum/count;
    mean_coordo(j+1,1) = j;
    mean_coordo(j+1,2) = sum_x/count;
    mean_coordo(j+1,3) = sum_y/count;
end

mean_nb_pixels
mean_coordo

clear; clc;

%Loading training datas
full_train = load('train.txt');

train = full_train(1:20000,:);
validation = full_train(20001:30000,:);

%Get size of the training datas
[height width] = size(train);

nb_pixels = zeros(width,2);
coordo = zeros(width,3);

%Computing parameters
for i=1:height
    nb_pixels(i,1) = train(i,1);
    coordo(i,1) = train(i,1);
    
    count_px = 0;
    x_mean = 0;
    y_mean = 0;
    
    for j=2:width
        if train(i,j) == 1
            count_px = count_px + 1;
            x_mean = x_mean + mod(j-1,8);
            y_mean = y_mean + fix((j-1)/8);
        end
    end
    
    coordo(i,2) = x_mean/count_px;
    coordo(i,3) = y_mean/count_px;
    nb_pixels(i,2) = count_px;
end

%Average of pixels number for each characters in the training set
mean_nb_pixels = zeros(26,2);

%Average of coordonates for pixels in the training set
mean_coordo = zeros(26,3);

mean_full = zeros(26,2);

for j=0:25
    sum = 0;
    sum_x = 0;
    sum_y = 0;
    count = 0;
    for i=1:height
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
    
    mean_full(j+1,1) = j;
    mean_full(j+1,2) = (mean_nb_pixels(j+1,2) + mean_coordo(j+1,2) + mean_coordo(j+1,3))/3;
end

mean_nb_pixels
mean_coordo
mean_full

error_pixels = 0;
error_y = 0;
error_x = 0;
error_full = 0;

error_letters = zeros(26,26);
    
for i=1:10000 
   count_px = 0;
   x_mean = 0;
   y_mean = 0;
   
   for j=2:width
       if validation(i,j) == 1
           count_px = count_px + 1;
           x_mean   = x_mean + mod(j-1,8);
           y_mean   = y_mean + fix((j-1)/8);
       end
   end
    
   x_mean = x_mean/count_px;
   y_mean = y_mean/count_px;
   count_px;
   coeff_full = (x_mean+y_mean+count_px)/3;
   
   diff_y = 16;
   diff_x = 8;
   diff_px = 128;
   diff_full = 1000;
   current_carac_y = 0;
   current_carac_x = 0;
   current_carac_px = 0;
   current_carac_full = 0;
   
   for k=1:26
       if abs(count_px-mean_nb_pixels(k,2)) < diff_px
            current_carac_px = mean_nb_pixels(k,1);
            diff_px = abs(count_px-mean_nb_pixels(k,2));
       end
       
       if abs(x_mean-mean_coordo(k,2)) < diff_x
            current_carac_x = mean_coordo(k,1); 
            diff_x = abs(x_mean-mean_coordo(k,2));
       end
       
       if abs(y_mean-mean_coordo(k,3)) < diff_y
            current_carac_y = mean_coordo(k,1); 
            diff_y = abs(y_mean-mean_coordo(k,3));
       end
       
       if abs(coeff_full-mean_full(k,2)) < diff_full
            current_carac_full = mean_full(k,1); 
            diff_full = abs(coeff_full-mean_full(k,2));
       end
   end
   
   if current_carac_y ~= validation(i,1)
       error_y = error_y + 1;
       error_letters(validation(i,1)+1,current_carac_y+1) = error_letters(validation(i,1)+1,current_carac_y+1) + 1;
   end
   
   if current_carac_x ~= validation(i,1)
       error_x = error_x + 1;
   end
   
   if current_carac_px ~= validation(i,1)
       error_pixels = error_pixels + 1;
   end
   
   if current_carac_full ~= validation(i,1)
       error_letters(validation(i,1)+1,current_carac_full+1) = error_letters(validation(i,1)+1,current_carac_full+1) + 1;
   end
end

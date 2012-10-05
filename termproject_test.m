clear; clc;

%Loading training datas
full_train = load('train.txt');
coeff = load('coeff.txt');

train = full_train(1:30000,:);
validation = full_train(30001:40000,:);


%Get size of the training datas
[height width] = size(train);
[height2 width2] = size(validation);

classificator = zeros(26,129);

for i=0:25
    count_letter = 0;
    for j=1:height
        if train(j,1) == i
            classificator(i+1,:) = classificator(i+1,:) + train(j,:);
            count_letter = count_letter + 1;
        end
    end
    
    classificator(i+1,:) = classificator(i+1,:)/count_letter;
end

classificator;
good_result = 0;

for i=1:height2
    error = zeros(26,2);
    for j=1:26
        error(j,1) = j-1;
        for k=2:width2
            error(j,2) = error(j,2) + (abs(validation(i,k)-classificator(j,k)))*coeff(k-1);
        end
    end
    
    current_error = 1000;
    current_letter = 0;
    
    for j=1:26
        if error(j,2) < current_error
            current_letter = j-1;
            current_error = error(j,2);
        end
    end
    
    if current_letter == validation(i,1);
        good_result = good_result+1;
    end
end

clear; clc;

%Loading training datas
full_train = load('train.txt');

train = full_train(1:20000,:);
validation = full_train(20001:30000,:);

%Get size of the training datas
[height width] = size(train);

proba_letter = calc_proba_letter(train(:,1))
proba_letter_hole = calc_proba_hole2(train)
proba_letter_diago = calc_proba_diago2(train)

good_result = 0;

var = zeros(5000,3);


for i=1:10000   
    var(i,1) = validation(i,1);
    var(i,2) = calc_letter(proba_letter,proba_letter_diago,proba_letter_hole,validation(i,:));
    if var(i,1) == var(i,2)
        good_result = good_result+1;
    end
end

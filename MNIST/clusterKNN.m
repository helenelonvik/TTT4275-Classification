%Now design a KNN classifier with K=7. Find the confusion matrix and the error rate and compare to the two other systems.

load('data_all.mat');
load('clusters.mat');
K = 7;
classes = 10;

tic
predictedNumbers = zeros(classes, num_test);
for i = 1:num_test
    idx = knnsearch(clusters, testv(i,:), 'K', K);     % get index of the 7 closest objects
    countNumbers = zeros(classes,1);
    for j = 1:K
        number = testlab(idx(j));
        countNumbers(number+1) = countNumbers(number+1) + 1;
    end
    
    [~,index] = max(countNumbers);
    predictedNumbers(index,i) = 1;   
end
toc

knowns =  zeros(10, num_test);
for k = 1:num_test
    knowns(testlab(k)+1,k) = 1;
end

plotConfusion(knowns, predictedNumbers)


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
        number = clusterClass(idx(j));
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

% Plot confusion matrix
plotConfusion(knowns, predictedNumbers, 'ClusterKNN')

% Error Rate 
errorRate = (num_test-trace(confusionKNN))/num_test;
disp('Error Rate - NN without clustering:')
disp(errorRate);

confusionKNN = [956 0 15 0 0 5 13 3 7 8;
                1 1128 12 3 13 4 6 31 2 8;
                2 2 944 10 2 1 1 14 4 5;
                1 1 12 950 0 25 0 3 32 12;
                0 1 4 0 906 1 8 12 9 37;
                9 0 0 17 1 840 3 1 25 7;
                1 0 16 10 2 1 0 927 6 24;
                1 1 24 16 3 3 2 1 879 5;
                0 0 0 3 45 3 0 36 7 902]



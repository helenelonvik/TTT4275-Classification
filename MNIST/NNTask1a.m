%% Task 2.1a)

load("data_all.mat");           % Includes num_test, num_train, testlab, testv, trainlab, trainv, vec_size
load('NN_pred.mat');            % Includes the result 
load('confusionNN.mat');
numClasses = 10; 

% NN Classifier (Comment out when finished - and save NN_pred )
pred = zeros(10, num_test);
% tic
% [NN_pred] = NNClassifier(pred, num_test, trainv, testv, trainlab);
% toc

% Confusion Matrix - Comparing NNpred with the knowns. 
knowns =  zeros(10, size(NN_pred,2));
for k = 1:size(NN_pred,2)
    knowns(testlab(k)+1,k) = 1;
end

% Plot confusion matrix 
figure(1)
plotConfusion(knowns, NN_pred,"NN without clustering");

% Error Rate 
errorRate = (num_test-trace(confusionNN))/num_test;
disp('Error Rate - NN without clustering:')
disp(errorRate);

% errorRate = errorRate(num_test, confusionNN, num_test, 'Confusion NN');


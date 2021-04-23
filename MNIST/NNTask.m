
% In the first part part the whole training set shall be used as templates.
% Thus, it compares distance from every test case to every training case

% OBS! The code takes time to run (results are stored in results1a.mat)

%% Task 2.1a)

% Load data 
data = load("data_all.mat");  % Includes num_test, num_train, testlab, testv, trainlab, trainv, vec_size
load('NN_pred.mat');            % Includes the result 

% Nearest Neighbourhood Classifier (comment out when finished running)
% pred = zeros(10, data.num_test);
% tic
% NNpred = NNClassifier(pred, data.num_test, data.trainv, data.testv, data.trainlab);
% toc

% Confusion Matrix - Comparing NNpred with the knowns. 
plotConfusion(pred, data.num_test, data.testlab)

% Error Rate 
confusionMx= zeros(10);
[errorRate] = errorRate(confusionMx, NN_pred, data.num_test, data.testlab)
disp('Error Rate: ');
disp(error_rate);





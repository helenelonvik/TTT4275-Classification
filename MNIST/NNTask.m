
% In the first part part the whole training set shall be used as templates.
% Thus, it compares distance from every test case to every training case

% OBS! The code takes time to run (results are stored in results1a.mat)

%% Task 2.1a)

% Load data 
data = load("data_all.mat");  % Includes num_test, num_train, testlab, testv, trainlab, trainv, vec_size
load('NN_pred.mat');            % Includes the result 

% Nearest Neighbourhood Classifier
% disp('Start NN Classifier');
% pred = zeros(10, data.num_test);
% tic
% NNpred = NNClassifier(pred, data.num_test, data.trainv, data.testv, data.trainlab);
% toc
% disp('End NN Classifier');

% Confusion Matrix - Comparing NNpred with the knowns. 

plotConfusion(pred, data.num_test, data.testlab)

% Error Rate 
confusion_matrix = zeros(10);
for i = 1:data.num_test
    confusion_matrix(NN_pred(i)+1,data.testlab(i)+1) = confusion_matrix(NN_pred(i)+1,data.testlab(i)+1)+1;
end
error_rate = 1 - trace(confusion_matrix)/data.num_test;  % trace calculates the sum of the diagonal elements
disp('Error rate: ');
disp(error_rate);

% The data sets should preferably be split up into chunks ofimages (for example 1000) in order to a) avoid 
% too big distance matrixes b) avoid using excessive time (as when classifying a single image at a time)





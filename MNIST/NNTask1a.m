%% Task 2.1a)

% Load data 
data = load("data_all.mat");    % Includes num_test, num_train, testlab, testv, trainlab, trainv, vec_size
load('NN_pred.mat');            % Includes the result 

% NN Classifier (comment out when finished running)
% pred = zeros(10, data.num_test);
% tic
% NNpred = NNClassifier(pred, data.num_test, data.trainv, data.testv, data.trainlab);
% toc

% Confusion Matrix - Comparing NNpred with the knowns. 
knowns =  zeros(10, size(NN_pred,2));
for k = 1:size(NN_pred,2)
    knowns(data.testlab(k)+1,k) = 1;
end

figure(1)
plotConfusion(knowns, NN_pred);
title("NN without clustering");

% Error Rate   OBS Må fikse Error Rate
%C = confusionmat(knowns, NN_pred);
% err_classification = (data.num_test - trace(C))/(data.num_test);
%error_rate = 1 - trace(C)/num_test;
% disp('Error Rate: ');
% disp(errorRate);





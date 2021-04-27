close all
clear
clc

load('data_all.mat');
load('clusters.mat');
load('confClusterNN.mat');
classes = 10;

tic
predictedNumbers = zeros(classes,num_test);
for i = 1:num_test
    D = dist(clusters, testv(i,:).');
    [~,index] = min(D);
    number = clusterClass(index);
    predictedNumbers(number+1,i) = 1;    
end
toc

knowns =  zeros(10, num_test);
for k = 1:num_test
    knowns(testlab(k)+1,k) = 1;
end

% Plot confusion matrix
plotConfusion(knowns, predictedNumbers, 'ClusterNN')

% Error rate 
errorRate = (num_test-trace(confClusterNN))/num_test;
disp('Error Rate - NN with clustering:')
disp(errorRate);

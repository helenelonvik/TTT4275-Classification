close all
clear
clc

%Find the confusion matrix and the error rate for the NN classifier using these M = 64 templates pr class. 

load('data_all.mat');
load('clusters.mat');
classes = 10;

tic
predictedNumbers = zeros(classes,num_test);
for i = 1:num_test
    D = dist(clusters, testv(i,:).');
    [~,index] = min(D);
    number = clusterClass(index);
    predictedNumber(number+1,i) = 1;    
end
toc
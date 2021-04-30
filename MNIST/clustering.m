%% Clustering of 600 training vectors for each class into M = 64 clusters
close all
clear
clc

M = 64;
numClasses = 10;

load("data_all.mat");

clusters = zeros(M*10,vec_size); % allocation empty space for clustered templates
clusterClass = zeros(M*10,1); % indicate what class the cluster belongs to
tic
for i = 0:9
    train_i = trainv(trainlab == i,:);  % getting every vector which has index where trainlab has the number i (Making class of number 1)
    [~,C] = kmeans(train_i,M);          % cluster the class
    clusters(M*i+1:M*(i+1),:) = C;      % placing cluster in matrix
    clusterClass(M*i+1:M*(i+1)) = i*ones(M,1);
    fprintf('Class %d clustered\n',i);
end
toc

save('clusters.mat', 'clusters', 'clusterClass');


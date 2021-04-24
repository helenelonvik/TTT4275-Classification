%% 2a clustering of 600 training vectors for each class into M = 64 clusters

M = 64;
numClasses = 10;

data = load("data_all.mat");

tic
%sorting training data into classes according to trainlab
[trainlabSorted, sortIndex] = sort(trainlab);
trainvSorted = zeros(num_train, vec_size);
for i = 1:num_train 
    trainvSorted(i,:) = trainv(sortIndex(i),:);
end

%cluster
cluster = zeros(M*numClasses, vec_size);
j = 1;
k = 1;
for i=0:9 %numClasses-1
    k = j;
    while j < num_train && trainlabSorted(j+1)==i
        j = j +1;
    end
    trainv_i = trainvSorted(k:j,:);
    
     % Do clustering:
    [idxi,Ci] = kmeans(trainv_i,M);
    fprintf('Class %d clustered\n',i);
    cluster((i*M+1):((i+1)*M),:) = Ci;
end

K = 1;
cluster_labels = repelem([0 1 2 3 4 5 6 7 8 9]', M);
Mdl = fitcknn(cluster,cluster_labels,'NumNeighbors',K);
nn_labels = predict(Mdl, testv);


toc

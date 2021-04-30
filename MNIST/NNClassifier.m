function [pred] = NNClassifier(pred, num_test, trainv, testv, trainlab)
    for i = 1:num_test
        dists = dist(trainv, testv(i,:).');  % Euclidian distance between train- and test-set
        [~, index] = min(dists);
        predNum = trainlab(index);    
        pred(predNum + 1,i) = 1;
    end
end


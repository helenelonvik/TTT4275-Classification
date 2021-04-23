function [pred] = NNClassifier(pred, num_test, trainv, testv, label)
    for i = 1:num_test
        dists = dist(trainv, testv(i,:).');  % Euclidian distance between training- and testset
        [~, index] = min(dists);
        predNum = label(index);
        pred(predNum + 1,i) = 1;
    end
end


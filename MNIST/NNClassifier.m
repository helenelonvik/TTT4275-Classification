function [pred, confusionMx] = NNClassifier(pred, num_test, trainv, testv, trainlab, testlab)
    for i = 1:num_test
        dists = dist(trainv, testv(i,:).');  % Euclidian distance between training- and testset
        [~, index] = min(dists);
        predNum = trainlab(index);
        knownNum = testlab(i);     
        pred(predNum + 1,i) = 1;
        
        confusionMx = zeros(10,10);
        confusionMx(knownNum+1, predNum+1) = confusionMx(knownNum+1, predNum+1)+1;
        
    end
end


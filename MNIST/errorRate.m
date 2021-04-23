function [errorRate] = errorRate(confusionMx, NN_pred, num_test, testlab)
    for i = 1:num_test
        confusionMx(NN_pred(i)+1,testlab(i)+1) = confusionMx(NN_pred(i)+1,testlab(i)+1)+1;
    end
    errorRate = 1 - trace(confusionMx)/num_test;   % trace calculates the sum of the diagonal elements
end
function [errorRate] = errorRate(confusionMx, NN_pred, num_test, testlab)
    disp('im here1')
    for i = 1:num_test
        confusionMx(NN_pred(i)+1,testlab(i)+1) = confusionMx(NN_pred(i)+1,testlab(i)+1)+1;
    end
    disp('im here')
    errorRate = 1 - trace(confusionMx)/num_test;   % Trace calculates the sum of the diagonal elements
end


function [errorRate] = errorRate(num_test, confusionNN)
    errorRate = (num_test-trace(confusionNN))/num_test;
%     disp('Error Rate - NN without clustering:')
%     disp(errorRate);
end
function errorRate = errorRate(num_test, confusionMx, num_test, arg)
    errorRate = (num_test-trace(confusionMx))/num_test;
    disp(arg)
    disp(errorRate);
end
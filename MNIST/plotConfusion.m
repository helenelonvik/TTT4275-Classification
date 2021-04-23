function [] = plotConfusion(pred, num_test, testlab)
    known =  zeros(10,num_test);

    for i = 1:num_test
        l = testlab(i);
        known(l+1,i) = 1;
    end

    % Plot confusion
    plotconfusion(known,pred);
    title({'Confusion Matrix', 'NN Classifier wihout clustering'});
    xticklabels({'0','1','2','3','4','5','6','7','8','9'});
    yticklabels({'0','1','2','3','4','5','6','7','8','9'});

end
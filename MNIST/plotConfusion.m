function plotConfusion(knowns, pred)
  
    % Plot confusion
    plotconfusion(knowns,pred);
    title({'Confusion Matrix', 'NN Classifier without clustering'});
    
    xlabel("Classifier output",'FontSize', 12, 'FontWeight', 'bold');
    ylabel("True label",'FontSize', 12, 'FontWeight', 'bold');    
    xticklabels({'0','1','2','3','4','5','6','7','8','9'});
    yticklabels({'0','1','2','3','4','5','6','7','8','9'});

end


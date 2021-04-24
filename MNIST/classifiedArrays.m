function [corrClassifiedArray, missClassifiedArray] = classifiedArrays(labels,predictions, testvalues)
    % Cunting number of correctly or miss-classified values
    numCorr = 0;
    numMiss = 0;
    targets = zeros(10, size(testvalues,1));
    for k = 1:size(testvalues,1)
        targets(labels(k)+1,k) = 1;
        [~,i] = max(predictions(:,k));
        if labels(k)+1 == i
            numCorr = numCorr +1;
        else 
            numMiss = numMiss +1;
        end
    end
    
    % Generating array of correctly- or miss-classified indices
    corrClassifiedArray = zeros(numCorr,1);
    missClassifiedArray = zeros(numMiss,1);
    index = 1;
    for k = 1:size(testvalues,1)
        [~,i] = max(predictions(:,k));
        if labels(k)+1 == i
            corrClassifiedArray(index) = k;
            index = index + 1;
        else
            missClassifiedArray(index) = k;
            index = index + 1;
        end
    end
   


end
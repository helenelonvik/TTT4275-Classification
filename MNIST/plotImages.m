%% Task 2.1 b) and c)
clear all
close all

%loading data
load('data_all.mat');
load('NN_pred.mat');

% Indices of missclassified and correctly classified images 
[corrClassifiedArray, missClassifiedArray] = classifiedArrays(testlab, NN_pred, testv);
missC = [116,196,242,382];          % Indices found in missClassifiedArray
corrC = [110,192,232,380];          % Indices found in corrClassifiedArray

x = zeros(28,28);

figure(1)
sgtitle("Missclassified Pictures")
for i = 1:size(missC, 2)
    x(:) = testv(missC(i),:)
    subp = 220 + i;
    subplot(subp);
    image(rot90(flip(x),3));
end

figure(2)
sgtitle("Correct Classified Pictures")
for i = 1:size(corrC, 2)
    x(:) = testv(corrC(i),:)
    subp = 220 + i;
    subplot(subp);
    image(rot90(flip(x),3));
end

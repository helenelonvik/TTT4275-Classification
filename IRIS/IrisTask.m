clear all
close all

%% Task 1.1a)
% Choose the first 30 samples for training and the last 20 samples for testing.

% Defining initial variables
C = 3;                          %Number of classes
D = 4;                          %Number / Dimention of the input vectors (features)

dataClass1 = load('class_1');
dataClass2 = load('class_2');
dataClass3 = load('class_3');


%Training and test indices 
NumTrainC= 30;  
NumTrain = NumTrainC * C;
NumTestC = 20;
NumTest = NumTestC * C;
NumDataC = 50;
NumData = NumDataC * C;


% First 30 data points for training and the last 20 for testing
% trainSet = [dataClass1(1:NumTrainC,:).', dataClass2(1:NumTrainC,:).', dataClass3(1:NumTrainC,:).'];
% testSet = [dataClass1(NumTrainC+1:NumDataC,:).', dataClass2(NumTrainC+1:NumDataC,:).', dataClass3(NumTrainC+1:NumDataC,:).'];

% Last 30 data points for testing and the last 30 for training
%testSet = [dataClass1(1:NumTestC,:).', dataClass2(1:NumTestC,:).', dataClass3(1:NumTestC,:).'];
%trainSet = [dataClass1(NumTestC+1:NumDataC,:).', dataClass2(NumTestC+1:NumDataC,:).', dataClass3(NumTestC+1:NumDataC,:).'];


%%Task 2a 
% removing unwanted features (2, 1, 3)
dataClass1(:,2) = [];
dataClass2(:,2) = [];
dataClass3(:,2) = [];
D = 3;
% removing feature 1
dataClass1(:,1) = [];
dataClass2(:,1) = [];
dataClass3(:,1) = [];
D = 2;
% removing feature 3
dataClass1(:,2) = []; %original feature 3 is now in column 2
dataClass2(:,2) = [];
dataClass3(:,2) = [];
D = 1;
% use first 30 samples for training and 20 for test
trainSet = [dataClass1(1:NumTrainC,:).', dataClass2(1:NumTrainC,:).', dataClass3(1:NumTrainC,:).'];
testSet = [dataClass1(NumTrainC+1:NumDataC,:).', dataClass2(NumTrainC+1:NumDataC,:).', dataClass3(NumTrainC+1:NumDataC,:).'];


%% Task 1.11b)
% Train a linear classifier as described in subchapter 2.4 and 3.2. 
% Tune the step factor alpha in equation 19 until the training converge

% Defining variables
alpha = 0.01;              % Tuned step factor - smallest possible MSE after training
NumIterations = 3000;      % Breaking condition -  Obs: Could have used tol = 0.2>norm(grad)
                                                
MSEs = zeros(1, NumIterations);             % Training variable
gradsMSE = zeros(1, NumIterations);         % Training variable

W0 = zeros(C, D);
w0 = zeros(C, 1);
W = [W0 w0];

% MSE and Gradient of MSE
MSEm = @(gk,tk) 0.5*(gk-tk)'*(gk-tk);
gradMSE = @(gk,tk,xk) ((gk-tk).*gk.*(1-gk))*xk.';

% Training the linear classifier
for m = 1:NumIterations
    
    grad = 0;
    MSE = 0;
    
    for k = 1:size(trainSet,2)
        xk = [trainSet(:,k); 1];
        
        c = floor((k-1)/NumTrain * C) + 1;  % Increases once per iteration
        tk = zeros(C, 1);
        tk(c) = 1;                          % Defining targets (MSE requires target values at the output)
        
        zk = W*xk + w0;
        gk = sigmoid(zk);
        
        grad = grad + gradMSE(gk,tk,xk);    % Summing up the elements of gradMSE
        MSE = MSE + MSEm(gk,tk);
    end
    
    W = W - alpha*grad;
    MSEs(m) = MSE;
    gradsMSE(m) = norm(grad);
        
end

% Plots for tuning the step factor (alpha) 
figure(1);
plot(MSEs), grid;
title('Minimum Square Error (MSE)');
xlabel('Iteration');
ylabel('MSE magnitude');

figure(2);
plot(gradsMSE), grid;
title('MSE Gradient');


%% Task 1.1c) 
% Find the confusion matrix and the error rate for both the training and the test set.

% Confusion matrix - training 
confusionTrain = zeros(C);
for k = 1:NumTrain
    xk = [trainSet(:,k); 1];
    
    c = floor((k-1)/NumTrain * C) + 1;
    tk = zeros(C, 1);
    tk(c) = 1;
    
    zk = W*xk + w0;
    gk = sigmoid(zk);
    
    [gMax, cMax] = max(gk);
    confusionTrain(c, cMax) = confusionTrain(c, cMax) + 1;
end
% Error rate - Training 
errorRateTrain = 1 - trace(confusionTrain)/NumTrain;

disp('Error rate - Training: ');
disp(errorRateTrain);
disp('Confusion matrix - Training: ');
disp(confusionTrain);

% Confusion matrix - Testing
confusionTest = zeros(C);
for k = 1:NumTest
    xk = [testSet(:,k); 1];
    
    c = floor((k-1)/NumTest * C) + 1;
    tk = zeros(C, 1);
    tk(c) = 1;
    
    zk = W*xk + w0;
    gk = sigmoid(zk);
    
    [gMax, cMax] = max(gk);
    confusionTest(c, cMax) = confusionTest(c, cMax) + 1;
end
% Error rate - training 
errorRateTest = 1 - trace(confusionTest)/NumTest;

disp('Error rate - Testing: ');
disp(errorRateTest);
disp('Confusion matrix - Testing: ');
disp(confusionTest);

disp('MSE: ');
disp(MSEs(end));





clear all
close all

%% Task 1a)
% Choose the first 30 samples for training and the last 20 samples for testing.

class1Data = load('class_1');
class2Data = load('class_2');
class3Data = load('class_3');

NumTrain= 30;             
NumTest = 20;
NumTot = 50;

trainSet = [class1Data(1:NumTrain,:).', class2Data(1:NumTrain,:).', class3Data(1:NumTrain,:).'];
testSet = [class1Data(NumTrain+1:NumTot,:).', class2Data(NumTrain+1:NumTot,:).', class3Data(NumTrain+1:NumTot,:).'];

%% Task 1b)
% Train a linear classifier as described in subchapter 2.4 and 3.2. 
% Tune the step factor alpha in equation 19 until the training converge

% Defining initial variables
C = 3;                          %Number of classes
D = 4;                          %Number / Dimention of the input vectors (features)

% Defining variables
alpha = 0.01;
tol = 0.2;
W = eye(C, D + 1);

% MSE requires target values at the output
t1 = [1 0 0].';
t2 = [0 1 0].';
t3 = [0 0 1].';
targets = [repmat(t1, 1, NumTrain), repmat(t2,1,NumTrain),repmat(t3,1,NumTrain)];

% Gradient of MSE
gradMSE = @(gk,tk,xk) ((gk-tk).*gk.*(1-gk))*xk.';

while true
    
    grad = zeros(size(W));
   
    for k = 1:size(trainSet,2)
        xk = [trainSet(:,k); 1];
        z = W*xk;
        gk = sigmoid(z);
        tk = targets(:,k);
        grad = grad +  gradMSE(gk,tk,xk);    % Summing up the elements of gradMSE
    end
    
    W = W - alpha*grad;
    
    if norm(grad) > tol
        break
    end
     
end








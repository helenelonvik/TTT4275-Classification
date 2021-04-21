close all
clear all
clc

%Load data
C = 3;                          %Number of classes
D = 4;                          %Number / Dimention of the input vectors (features)
numBins = 10;

dataClass1 = load('class_1');
dataClass2 = load('class_2');
dataClass3 = load('class_3');
allClasses = [dataClass1; dataClass2; dataClass3];

% trainSet = [dataClass1(1:NumTrainC,:).', dataClass2(1:NumTrainC,:).', dataClass3(1:NumTrainC,:).'];
% testSet = [dataClass1(NumTrainC+1:NumDataC,:).', dataClass2(NumTrainC+1:NumDataC,:).', dataClass3(NumTrainC+1:NumDataC,:).'];

figure(1); hold on;
histogram(dataClass1(:,1),numBins)
histogram(dataClass2(:,1),numBins)
histogram(dataClass3(:,1),numBins)
xlabel("Sepal Length")
legend('Setesa','Versicolor','Verginica')

figure(2); hold on;
histogram(dataClass1(:,2),numBins)
histogram(dataClass2(:,2),numBins)
histogram(dataClass3(:,2),numBins)
xlabel("Sepal Width")
legend('Setesa','Versicolor','Verginica')

figure(3); hold on;
histogram(dataClass1(:,3),numBins)
histogram(dataClass2(:,3),numBins)
histogram(dataClass3(:,3),numBins)
xlabel("Petal Length")
legend('Setesa','Versicolor','Verginica')

figure(4); hold on;
histogram(dataClass1(:,4),numBins)
histogram(dataClass2(:,4),numBins)
histogram(dataClass3(:,4),numBins)
xlabel("Petal Width")
legend('Setesa','Versicolor','Verginica')



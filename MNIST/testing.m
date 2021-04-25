close all
clear
clc
load("data_all.mat");

data = trainv(1:20,400:420)
set = trainlab(1:20)

train_i = data(set == 0, :)
# Title: Iris Plants Database
Updated Sept 21 by Guro Veglo and Helene Lønvik

The corresponding code can be found in IrisTask.m. 

## Design/training and generalization
a. 30 samples for training and the last 20 samples for testing was defined. 
b. The linear classifier described in subchapter 2.4 and 3.2 was tuned, resulting in the step factor alpha = 0.1. 
   This lead to convergence for the training, and was found by plotting both the MSE and MSE gradient. 
c. The confusion matrix and the error rate for both the training and the test set was found. 
   This gave: Test error rate = 0.0333 and Training error rate = 0.0222, and the matrices:

Training confusion matrix:
--- | -- | --
30  | 0  | 0
0   | 28 | 2
0   | 0  | 30

Testing confusion matrix:
--- | -- | --
30  | 0  | 0
0   | 28 | 2
0   | 0  | 30


d. Using the last 30 samples for training and the first 20 samples for test. Repeated the training and test phases for this case.
e. 
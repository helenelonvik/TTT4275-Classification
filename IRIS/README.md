# Title: Iris Plants Database

This task includes a function for classifying iris flower. The corresponding code can be found in IrisTask.m. The first part has focus on design/training and generalization. The second part has focus on features and linear separability.

## In summation
- 30 samples for training and the last 20 samples for testing was defined. 
- The linear classifier described in subchapter 2.4 and 3.2 was tuned, resulting in the step factor alpha = 0.1. This lead to convergence for the training, and was found by plotting both the MSE and MSE gradient. 
- The confusion matrix and the error rate for both the training and the test set was found. This gave: Test error rate = 0.0333 and Training error rate = 0.0222.
- Using the last 30 samples for training and the first 20 samples for test. Repeated the training and test phases for this case. Thus, we end up with Test error rate = 0 and Training error rate = 0.0556. We can see that the total error rate is the same in both of the cases. It is also clear that the testing case in d. gives zero error rate. 
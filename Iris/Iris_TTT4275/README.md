# Title: Iris Plants Database

The corresponding code can be found in IrisTask.m. 

## Design/training and generalization
1. 30 samples for training and the last 20 samples for testing was defined. 
2. The linear classifier described in subchapter 2.4 and 3.2 was tuned, resulting in the step factor alpha = 0.1. 
   This lead to convergence for the training, and was found by plotting both the MSE and MSE gradient. 
3. The confusion matrix and the error rate for both the training and the test set was found. 
   This gave: Test error rate = 0.0333 and Training error rate = 0.0222, and the confusion matrices:

Training confusion matrix (30/20):   
   T / P   | 1  | 2  | 3  |  
-----------|----|----|----|
    1      | 30 | 0  | 0  |
    2      | 0  | 28 | 2  |
    3      | 0  | 0  | 30 |


Testing confusion matrix (30/20):
   T / P   | 1  | 2  | 3  |   
-----------|----|----|----|
    1      | 20 | 0  | 0  |
    2      | 0  | 18 | 2  |
    3      | 0  | 0  | 20 |


4. Using the last 30 samples for training and the first 20 samples for test. Repeated the training and test phases for this case. 
   Thus, we end up with Test error rate = 0 and Training error rate = 0.0556, and the confusion matrices:


Training confusion matrix (20/30):
   T / P   | 1  | 2  | 3  |  
-----------|----|----|----|
    1      | 30 | 0  | 0  |
    2      | 0  | 28 | 2  |
    3      | 0  | 3  | 27 |


Testing confusion matrix (20/30):
   T / P   | 1  | 2  | 3  |  
-----------|----|----|----|
    1      | 20 | 0  | 0  |
    2      | 0  | 20 | 0  |
    3      | 0  | 0  | 20 |


. We can see that the total error rate is the same in both of the cases. 
   It is also clear that the testing case in d. gives zero error rate. 
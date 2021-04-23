
# Classification of handwritten numbers 0-9 (MNIST)

This contains implementations of different versions of the NN classifiers both with and without clustering. 

2.1 a)
In the first part part the whole training set shall be used as templates.
Thus, it compares distance from every test case to every training case. 
We could have split up into chunks of images (for example 1000) in order to 
- avoid too big distance matrixes 
- avoid using excessive time (as when classifying a single image at a time).
Instead we chose to save the results in NN_pred.mat.

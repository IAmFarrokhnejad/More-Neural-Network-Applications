# More-Neural-Network-Applications



S1: Iris 

Introduction:
In this project, we explore the use of Single-layer Perceptrons (SLP) and Multi-layer Perceptrons (MLP) for the classification of Iris flowers into three species: Setosa, Versicolor, and Virginica. We design and evaluate different neural network architectures on the Iris flowers dataset to understand their performance and limitations.



Network Design:
We designed a 4x3 Single-layer Perceptron network to predict the three species of Iris flowers.

Accuracy on Training and Test Sets:
The approximate accuracies (percentage of correct classifications) of the 4x3 SLP network architecture are as follows:
- Training Set Accuracy: 70.7%,
- Test Set Accuracy: 69.5% 

Class-wise Accuracies:
The approximate accuracies (percentage of correct classifications) for each class are as follows:
- Setosa Accuracy: 100%,
- Versicolor Accuracy: ~50%, 
-Virginica Accuracy: ~60%;

Most Difficult Class to Classify:
According to our results, class 1 (Setosa) is easily distinguishable from the other classes (Versicolour and Virginica). The SLP network could not identify classes 2 and 3 effectively, having around 50-60% accuracy for both. 

Single-layer Perceptron Suitability:
The Iris species classification problem cannot be effectively solved with a Single-layer Perceptron. This is because a Single-layer Perceptron can only learn linearly separable patterns, and the Iris dataset contains non-linear relationships between features and species, resulting in a subpar accuracy of around 70% .



Modified Single-layer Perceptron (4x2 SLP):

Network Design:
We designed a modified 4x2 Single-layer Perceptron network to predict only two species of Iris flowers: Setosa and Virginica.

Evaluation and Performance:
- Training Set Accuracy: 100% 
- Test Set Accuracy: 100%
  From the first network architecture, it was evident that the Setosa class is linearly separable from the other two types. This is confirmed by the perfect accuracy of the 4x2 SLP architecture.


Multi-layer Perceptron (4x10x3 MLP):

Network Design:
We designed a 4x10x3 Multi-layer Perceptron network to predict the three species of Iris flowers.


Accuracy on Training and Test Sets:
- Training Set Accuracy: 100%
- Test Set Accuracy: ~94-95%

Hyperparameter Tuning:
We experimented with different hyperparameters, such as learning rate and the number of hidden units, to enhance the performance of our models. The findings are as follows:
- Adjusting the number of hidden units in the range of 4-20 yielded miniscule impact on the performance of the network.
- Adjusting the transfer function for the hidden layer to sigmoid offered the fastest training. Yet, no notable impact on the accuracy of the network.
- Adjusting the learning rate factor (µ) did not affect the network’s performance.
- Increasing the layers to 3 by adding another hidden layer improved the network’s performance by ~1%



Comparison:
We compared the accuracy of the 4x3 SLP network and the 4x10x3 MLP network on the training and test sets.
- Training Set Accuracy Comparison: The MLP network was able to identify all the training data accurately, while the SLP lacked behind with around a 30% error rate. 
- Test Set Accuracy Comparison: The testing set was similar to the training set for both networks, harboring the same ~25%-30% difference in accuracy.



Conclusion:
In conclusion, this report demonstrated the limitations of Single-layer Perceptrons for the Iris species classification problem and the effectiveness of Multi-layer Perceptrons, especially when dealing with non-linear relationships in the data. Also, MLP networks can be improved slightly by adjusting the hyperparameters properly, such as learning rate factor and number of hidden layers.

# More-Neural-Network-Applications



##S1: Iris (SLP/MLP)

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












##S2: Digits(Pattern Association/Associative Neural Network)

Introduction:
In this project, we explore the use of Associative Neural Networks using the Hebb learning rule to determine the association of numbers (from 0 to 9) with their patterns. We design and evaluate the neural network in various ways and consider different aspects such as correlation between pattern representation and network’s storage capacity, correlation between network performance and type of presentation, etc. to understand the performance and thresholds of the architecture.


Capacity Threshold:
To test the network’s capacity, we stored all possible combinations of digits, from 2-digit to 7-digit sets. The results of which are as follows:
- 2-digit sets: 45 out of 45 sets had no errors in recall,
- 3-digit sets: 89 out of 120 (~74%) sets had no errors in recall (e.g., {1,3,5}, {1,5,7}),
- 4-digit sets: 74 out of 210 (~35%) sets had no errors in recall (e.g., {1,2,4,8}, {1,4,7,8}),
- 5-digit sets: 14 out of 252 (~5%) sets had no errors in recall (e.g., {0,1,4,6,7}, {1,4,7,8,9}),
- 6 and 7-digit sets: All sets had at least 1 incorrectly recalled pattern;

Evidently, there is no definitive number to the capacity of the network; ultimately, the network capacity depends on the chosen associations. However, we can deduce that the network cannot store more than 6 digits at a time without added modifications. 


Effect of Pattern Similarity on Network Capacity:
Pattern similarity is defined as the number of identical bits between a pair of patterns; for example, the patterns for the digits 6 and 9 are ~77% similar (27 out of 35 bits used to represent them are the same).
Based on our results, pattern similarity does affect the effective capacity of the network; if the stored patterns are similar to each other, the network may have trouble recalling these patterns.
Below is a list of pattern sets which had 0% recall accuracy (none of the input patterns were associated with their actual pattern), all of which are ~75-85% similar:
- 3-digit sets: {0,3,8}, {2,3,9} 
- 4-digit sets: {0,3,6,9}, {2,3,5,9}
- 5-digit sets: {0,2,3,5,9}, {0,3,5,8,9}
By comparing these sets with the sets that had perfect recall accuracy (e.g., {0,1,4,6,7} w/ ~50% similarity), we can observe that the more similar the patterns are in the stored associations, the lower the accuracy of the network will be.



Bipolar vs. Binary Pattern Representation:
After testing the network with binary representations of the patterns, we found that bipolar representation results in much better accuracy; the network could only support up to 3 digits without error with binary patterns, while it could support up to 5 using bipolar representation.


Maximum Noise Tolerance:
We tested the noise tolerance of the system by altering the input patterns from 0% to 100% with 5% increments. We found the following:
- The network was able to maintain its average accuracy levels up to 15% noise.
- Above 15% resulted in drastic performance degradation, and above 50% noise resulted in complete failure of the system to recognize patterns.
These numbers were obtained by measuring the average correct recalls of the network, and were consistent across different numbers of stored associations (2-digit to 6-digit sets).



Testing Noise Tolerance for Given Sets:
We tested the network’s ability the recall each of the given sets when 10% noise was applied. Each set was tested 1000 different times, and the number of completely correct recalls were as follows:
- Set {1,2,3,4}: ~83% (~830 out of 1000);
- Set {1,2,3}: ~94% (~940 out of 1000);
- Set {0,1,2,4}: ~100% (~1000 out of 1000);
- Set {0,1,2,5}: ~95% (~950 out of 1000).



Effect of Association Set Composition on Noise Tolerance:
The number of stored associations in the network is inversely related with the noise tolerance, specifically the noise threshold after which the accuracy starts to sharply decrease. Previously, we had measured this threshold to be 15%; however, the actual threshold varies between 15%-30%, depending on the number of stored patterns. For example, when 4 patterns are stored, this threshold seems to be around 15-20%, and when 2 patterns are stored, it stabilizes at around 30%. (Figures 4-6 illustrate the change in accuracy over corruption for different number of store associations).
On the other hand, pattern similarity did not have a notable effect on noise tolerance.



Iterative Presentation (Feedback Architecture):
We tested the effect of iterative presentation in 2 different ways:
- Using a discrete Hopfield architecture
- Using a modified Hopfield architecture w/ self-connections
We found that in both cases, iterative presentation only slightly improves the accuracy of the network over higher noise levels.



Conclusion:
In conclusion, our collaborative exploration of Associative Neural Networks using the Hebbian rule revealed significant insights. The network exhibited successful recall of sets up to 6 digits, with capacity influenced by pattern similarity. Bipolar pattern representation notably improved accuracy over binary. Noise tolerance tests showed resilience up to 15%, with a decline beyond 50%. The number of stored associations inversely affected noise tolerance, while the similarity of patterns had no major effect on noise tolerance. Iterative presentation, in both discrete and modified Hopfield architectures, marginally improved accuracy at higher noise levels. However, its impact was limited, suggesting inherent robustness in the basic architecture. 

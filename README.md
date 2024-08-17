# More-Neural-Network-Applications


## Authors

- [Morteza Farrokhnejad](https://github.com/IAmFarrokhnejad)
- [Ali Farrokhnejad](https://www.github.com/afr0011)

## S1: Iris (SLP/MLP)

### Introduction
This project explores the use of Single-layer Perceptrons (SLP) and Multi-layer Perceptrons (MLP) for classifying Iris flowers into three species: Setosa, Versicolor, and Virginica. We design and evaluate different neural network architectures using the Iris dataset to assess their performance and limitations.

### Network Design
We developed a 4x3 Single-layer Perceptron (SLP) network to predict the three species of Iris flowers.

### Accuracy on Training and Test Sets
- **Training Set Accuracy:** 70.7%
- **Test Set Accuracy:** 69.5%

### Class-wise Accuracies
- **Setosa:** 100%
- **Versicolor:** ~50%
- **Virginica:** ~60%

### Most Difficult Class to Classify
Class 1 (Setosa) is easily distinguishable from the other classes (Versicolor and Virginica). The SLP network struggled to effectively classify classes 2 and 3, achieving only 50-60% accuracy for both.

### Suitability of Single-layer Perceptron
The classification problem of Iris species cannot be effectively solved using a Single-layer Perceptron due to the non-linear relationships in the data. The SLP's performance, with an accuracy of around 70%, is suboptimal.

### Modified Single-layer Perceptron (4x2 SLP)
- **Network Design:** A modified 4x2 SLP was designed to classify only two species: Setosa and Virginica.
- **Training and Test Set Accuracy:** 100%

The perfect accuracy of the 4x2 SLP architecture confirms that Setosa is linearly separable from the other species.

### Multi-layer Perceptron (4x10x3 MLP)
- **Network Design:** We developed a 4x10x3 Multi-layer Perceptron (MLP) to predict the three species of Iris flowers.
- **Training Set Accuracy:** 100%
- **Test Set Accuracy:** ~94-95%

### Hyperparameter Tuning
- Adjusting the number of hidden units (4-20) had a minimal impact on performance.
- Using a sigmoid transfer function for the hidden layer resulted in faster training but did not significantly affect accuracy.
- Altering the learning rate factor (µ) had no impact on performance.
- Adding another hidden layer improved accuracy by ~1%.

### Comparison
- **Training Set Accuracy:** The MLP achieved 100% accuracy, whereas the SLP had a ~30% error rate.
- **Test Set Accuracy:** The MLP outperformed the SLP with a ~25%-30% higher accuracy.

### Conclusion
This study highlights the limitations of Single-layer Perceptrons for classifying Iris species and demonstrates the effectiveness of Multi-layer Perceptrons, particularly in handling non-linear data. Fine-tuning hyperparameters like learning rate and the number of hidden layers can marginally improve MLP performance.

## S2: Digits (Pattern Association/Associative Neural Network)

### Introduction
This project investigates the use of Associative Neural Networks with the Hebbian learning rule to associate numbers (0-9) with their corresponding patterns. Various aspects, such as the correlation between pattern similarity and network capacity, were examined to understand the network's performance and thresholds.

### Capacity Threshold
We tested the network’s capacity by storing all possible combinations of digits in sets ranging from 2 to 7 digits:
- **2-digit sets:** 45/45 sets had no recall errors.
- **3-digit sets:** 89/120 (~74%) sets had no recall errors.
- **4-digit sets:** 74/210 (~35%) sets had no recall errors.
- **5-digit sets:** 14/252 (~5%) sets had no recall errors.
- **6- and 7-digit sets:** All sets had at least one incorrectly recalled pattern.

The network cannot store more than 6 digits at a time without modifications.

### Effect of Pattern Similarity on Network Capacity
Pattern similarity, defined by the number of identical bits between patterns, affects network capacity. Highly similar patterns (e.g., digits 6 and 9) reduce recall accuracy.

### Bipolar vs. Binary Pattern Representation
Bipolar representation improved accuracy significantly, allowing the network to support up to 5 digits, compared to only 3 digits with binary representation.

### Maximum Noise Tolerance
Noise tolerance was tested by altering input patterns from 0% to 100%:
- The network maintained average accuracy up to 15% noise.
- Performance degraded sharply above 15%, and the system failed completely at 50% noise.

### Testing Noise Tolerance for Given Sets
The network's recall accuracy under 10% noise was tested 1,000 times for each set:
- **Set {1,2,3,4}:** ~83%
- **Set {1,2,3}:** ~94%
- **Set {0,1,2,4}:** ~100%
- **Set {0,1,2,5}:** ~95%

### Effect of Association Set Composition on Noise Tolerance
Noise tolerance decreases with an increase in the number of stored associations. The noise threshold varies between 15%-30%, depending on the number of patterns stored. Pattern similarity did not significantly affect noise tolerance.

### Iterative Presentation (Feedback Architecture)
Using iterative presentation with both discrete and modified Hopfield architectures only slightly improved accuracy at higher noise levels.

### Conclusion
Our exploration of Associative Neural Networks using the Hebbian rule revealed that the network could recall sets of up to 6 digits, with capacity affected by pattern similarity. Bipolar representation provided better accuracy than binary. The network was resilient to noise up to 15%, with a sharp decline beyond 50%. The number of stored associations inversely impacted noise tolerance, while pattern similarity had little effect. Iterative presentation marginally improved accuracy at higher noise levels, indicating inherent robustness in the basic architecture.

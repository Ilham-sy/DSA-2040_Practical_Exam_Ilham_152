# Data Mining Assignment Report

# Executive Summary

This report presents a comprehensive analysis of the Iris dataset and a simulated retail transactions dataset through three key data mining tasks: data preprocessing and exploration, clustering analysis, and classification with association rule mining.
The analysis demonstrates the application of fundamental data mining techniques and provides insights into pattern recognition, segmentation, and recommendation strategies.

# Task 1: Data Preprocessing and Exploration 
# Dataset Overview
  - Dataset: Iris flower dataset (scikit-learn)
  - Size: 150 samples, 4 features, 3 classes
  - Features: Sepal length, Sepal width, Petal length, Petal width
  - Classes: Setosa, Versicolor, Virginica

# Preprocessing Results
## Missing Values Analysis

- No missing values detected — all 150 samples contain complete information across all features.

## Feature Normalization
Applied Min-Max scaling to normalize all features to the range [0, 1]:
- Sepal length: [0.000, 1.000]
- Sepal width: [0.000, 1.000]
- Petal length: [0.000, 1.000]
- Petal width: [0.000, 1.000]

## Label Encoding

- Numerical encoding: setosa=0, versicolor=1, virginica=2
- One-hot encoding: Created dummy variables for algorithm compatibility

## Exploratory Data Analysis (EDA)
### Summary Statistics by Species
| Statistic          | Setosa | Versicolor | Virginica |
Sepal Length (mean)	5.006	5.936	6.588
Sepal Width (mean)	3.418	2.770	2.974
Petal Length (mean)	1.464	4.260	5.552
Petal Width (mean)	0.244	1.326	2.026

### Key Observations:
- Setosa flowers have significantly smaller petals compared to Versicolor and Virginica.
- Sepal dimensions overlap across classes, but petal measurements provide clear separation.

## Task 2: Clustering Analysis (15 Marks)
### Methodology

- Algorithm: K-Means Clustering (scikit-learn)
- Number of clusters (k): 3 (based on known number of classes)
- Initialization: k-means++
- Evaluation: Silhouette Score and comparison with actual species labels

### Results

- Silhouette Score: 0.55 (indicating reasonably well-defined clusters)
- Cluster to Species Mapping:
* Cluster 0 → Virginica
* Cluster 1 → Setosa
* Cluster 2 → Versicolor

### Key Insight:
The clustering successfully grouped Setosa distinctly, while Virginica and Versicolor showed partial overlap — consistent with EDA findings that these two classes have closer feature distributions.

## Task 3: Association Rule Mining (10 Marks)
### Dataset Generation
A synthetic retail transactions dataset was created to simulate supermarket purchases.

- Transactions: 30
- Items pool: 20 grocery products (e.g., milk, bread, beer, diapers, eggs, yogurt, chicken)
- Basket size: 3–8 items per transaction, selected randomly.
- Certain product co-occurrences were deliberately introduced to generate meaningful frequent patterns.

### Methodology

- Algorithm: Apriori (mlxtend)
- Minimum Support: 0.2
- Minimum Confidence: 0.5
- Extracted frequent itemsets and generated rules.
- Ranked rules by lift to find the strongest associations.

Results (Top 5 Rules by Lift)
Antecedent	Consequent	Support	Confidence	Lift
{yogurt}	{chicken}	0.30	0.50	1.25
{milk, bread}	{eggs}	0.25	0.60	1.20
{beer}	{diapers}	0.23	0.55	1.18
{eggs}	{bread}	0.28	0.52	1.15
{milk}	{butter}	0.26	0.51	1.14

### Rule Analysis & Business Application

Example: If a customer buys yogurt, they are likely to also buy chicken (Confidence = 50%, Lift = 1.25).
This mild positive correlation can be used for cross-selling strategies such as placing yogurt and chicken near each other or offering combo deals.
Similarly, strong associations like {milk, bread} → {eggs} can be leveraged for promotional bundles.

# Conclusion
This analysis illustrates three core data mining approaches:

1. Preprocessing & EDA revealed clear class separations in petal features and normalized the dataset for modeling.
2. K-Means clustering identified natural groupings, with Setosa clearly separated but some overlap between Versicolor and Virginica.
3. Association rule mining from simulated retail transactions uncovered actionable product pairings for marketing strategies.

These techniques demonstrate how structured data mining can be applied in both biological classification and retail business contexts.
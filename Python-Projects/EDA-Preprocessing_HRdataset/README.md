# Exploratory Data Analysis (EDA) and Preprocessing for HR Dataset

## Project Overview
This project involves performing EDA and preprocessing on the `HRdataset.csv` to extract insights, identify patterns, and prepare the data for further analysis or modeling.

---

## Table of Contents
1. [Dataset Description](#dataset-description)
2. [EDA Highlights](#eda-highlights)
3. [Key Insights](#key-insights)

## Dataset Description
- **Dataset Name**: `HRdataset.csv`
- **Size**: 1,470 rows × 35 columns
- **Features**:
  - **Numerical**: `Age`, `MonthlyIncome`, `YearsAtCompany`, etc.
  - **Categorical**: `Attrition`, `BusinessTravel`, `Department`, etc.
- **Target Variable**: `Attrition`

## EDA Highlights
The following exploratory steps were performed:

### 1. **Data Overview**
- Displayed the dataset structure using `df.info()` and `df.describe()`.
- Key Observations:
  - Dataset is complete, with no missing values.
  - Features such as `EmployeeCount` and `StandardHours` are constant.

**Key Insights**

**Attrition Distribution:**
~16% of employees experienced attrition, indicating a class imbalance.

**Correlated Features:**
YearsAtCompany and TotalWorkingYears are highly correlated with Age.

**Categorical Variables:**
BusinessTravel and JobRole show distinct distributions across Attrition classes.

**Code Example**:
```python
# Dataset Info
df.info()

# Statistical Summary
df.describe()

2. Target Variable Analysis
Analyzed the distribution of the target variable (Attrition):
High class imbalance: ~16% Attrition rate.

Code Example:

# Attrition distribution
sns.countplot(x='Attrition', data=df)
plt.title('Attrition Distribution')
plt.show()

3. Feature Correlation
Generated a heatmap to identify correlations among numerical features.
Strong correlations observed between Age, YearsAtCompany, and TotalWorkingYears.

Code Example:

# Correlation Heatmap
plt.figure(figsize=(12, 8))
sns.heatmap(df.corr(), annot=True, cmap='coolwarm')
plt.title('Correlation Heatmap')
plt.show()

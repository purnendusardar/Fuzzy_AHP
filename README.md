# Fuzzy AHP analysis in R
This R code is for performing a Fuzzy AHP (Analytic Hierarchy Process) analysis. The Fuzzy AHP is a popular method for decision-making problems where there are multiple criteria or alternatives to be considered.

# Required Packages
Before running the code, we need to make sure that the following packages are installed: `MASS`, `readxl`, and `FuzzyAHP`.

# Data Input
We need to input the pairwise comparison matrix of the criteria or alternatives in an excel file. We can use the read_excel function from the readxl package to read the excel file. In this example, the excel file is named "M2n.xlsx" and is located in the working directory.
The sample data looks like this!
![Sample_Data](/Sample_Data.png)

# Ranking
We can rank the alternatives or criteria based on the defuzzified results
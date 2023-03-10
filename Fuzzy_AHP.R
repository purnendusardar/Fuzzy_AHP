setwd('D:\\Local Disk E\\PhD_Data\\AAAAData_Objective2\\AHP')

library(MASS)
library(readxl)
library(FuzzyAHP)

values <- as.matrix(values)

AHP <- read_excel("M2n.xlsx", col_names = FALSE)


View(AHP)
comparisonMatrix = as.matrix(AHP)
comparisonMatrix=matrix(comparisonMatrix,nrow =7, ncol = 7, byrow =  FALSE)
comparisonMatrix = pairwiseComparisonMatrix(comparisonMatrix)

show(comparisonMatrix)
CR = consistencyRatio(comparisonMatrix, print.report = FALSE)
weakConsistency = weakConsistency(comparisonMatrix)
weights = calculateWeights(comparisonMatrix)
print(weights)

values <- matrix(rbinom( 49, 9, .5), nrow = 7)
df <- data.frame(values)
values = matrix(values, nrow = length(values)/length(weights@weights),
                ncol = length(weights@weights), byrow =TRUE)

resultAHP = calculateAHP(weights, values)
print(resultAHP)
rank = compareResults(resultAHP)

result = cbind(values, resultAHP, rank)
print(result)

fuzzyComparisonMatrix = fuzzyPairwiseComparisonMatrix(comparisonMatrix)
print(fuzzyComparisonMatrix)
result = calculateAHP(fuzzyComparisonMatrix, values)

fuzzyNumer = getFuzzyNumber(result, as.integer(2))
defuzzified = defuzziffy(result, "Yager")
print(defuzzified)
rank = (nrow(values)+1) - sum(is.na(defuzzified)) - rank(defuzzified, na.last = "keep", ties.method= "max")
print(rank)
ranked = compareFuzzyNumbers(result, "Chen")
print(ranked)

chang = calculateWeights_old_methods(fuzzyComparisonMatrix, "Chang")
print(calculateWeights_old_methods(fuzzyComparisonMatrix, "Chang"))
chang <-data.frame(chang)
write.csv(chang, "D:/Local Disk E/PhD_Data/AAAAData_Objective2/AHP", row.names=FALSE)
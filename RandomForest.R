##
# RandomForest.R
# 
# Script to create a RandomForest model on our dataset
# Part of I590 Project (Fall 2015)
#
# Authors: Jaini Vora (voraj) and Ankit Sadana (asadana)
##

# We have used the randomForest library in our code, uncomment next line if not already installed
#install.packages("randomForest")

# Using randomForestLibrary
library(randomForest)

# Setting the working directory
#setwd("C:/Users/Jaini/Desktop/OnlineNewsPopularity")
#setwd("~/workspace/Online-News-Popularity/")

# Reading the database into dat, depending on the need you can use either
# OnlineNewsPopularity-new-regular-shares.csv : numberical values of shares
#dat <- read.table("resources/OnlineNewsPopularity-new-regular-shares.csv", header = TRUE, sep = ",")
# OnlineNewsPopularity-new-binary-shares.csv : Yes/No values based on a threshold
dat <- read.table("resources/OnlineNewsPopularity-new-binary-shares.csv", header = TRUE, sep = ",")

# Spliting dat into training and test
# Sample size is set to 66% of the rows in dat
sample_size <- floor(0.66 * nrow(dat))
# Seed is used here so that you can replicate this train/test dataset
set.seed(123)
# train_index <- sample matrix using sample_size from length(nrows)
train_index <- sample(seq_len(nrow(dat)), size = sample_size)

# Training and test data
train_dat <- dat[train_index, ]
test_dat <- dat[-train_index, ]

# Splitting training data in features/label
trainFeatures <- train_dat[ , -(ncol(train_dat))]
trainLabel <- train_dat[ , (ncol(train_dat))]
# Splitting test data in features/label
testFeatures <- test_dat[ , -(ncol(test_dat))]
testLabel <- test_dat[ , (ncol(test_dat))]

# Creates the random forest with shares as the predicting label
rf=randomForest(x = trainFeatures, y = trainLabel, xtest = testFeatures , ytest = testLabel, 
                ntree=100, keep.forest=TRUE, importance = TRUE)
plot(rf)  #plots the random forest
# creating a legend for rf
rfPlot.legend <- (if (is.null(rf$test$err.rate)) {colnames(rf$err.rate)}
else {colnames(rf$test$err.rate)})
# Putting the legend on the plot
legend("top", cex =1.0, legend=rfPlot.legend, lty=c(1,2,3), col=c(1,2,3), horiz=T)
# Generating Importance plot
varImpPlot(rf, type=1)

print(rf$confusion) # prints the confusion matrix
print(rf$importance) #prints the importance of various attrbutes in decision making



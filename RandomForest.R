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
setwd("~/workspace/Online-News-Popularity/")

# Reading the database into dat, depending on the need you can use either
# OnlineNewsPopularity-new-regular-shares.csv : numberical values of shares
#dat <- read.table("resources/OnlineNewsPopularity-new-regular-shares.csv", header = TRUE, sep = ",")
# OnlineNewsPopularity-new-binary-shares.csv : Yes/No values based on a threshold
dat <- read.table("resources/OnlineNewsPopularity-new-binary-shares.csv", header = TRUE, sep = ",")


# Creates the random forest with shares as the predicting label
rf=randomForest(shares~.,data=dat,mtry=4,ntree=100)
plot(rf)  #plots the random forest
class(rf)
print(rf$confusion) # prints the confusion matrix
print(rf$importance) #prints the importance of various attrbutes in decision making

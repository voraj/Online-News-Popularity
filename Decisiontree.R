##
# RandomForest.R
# 
# Script to create a RandomForest model on our dataset
# Part of I590 Project (Fall 2015)
#
# Authors: Jaini Vora (voraj) and Ankit Sadana (asadana)
##

# We have used the randomForest library in our code, uncomment next line if not already installed
#install.packages("rpart")

# Using the library rpart
library(rpart)

# Setting the working directory
#setwd("C:/Users/Jaini/Desktop/OnlineNewsPopularity")
setwd("~/workspace/Online-News-Popularity/")

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

#Build a decision tree using rpart
dtree=rpart(shares~.,data=train_dat,control=rpart.control(10))
str(dtree)
print(dtree)
plot(dtree)
print(dtree$variable.importance)

#Make prediction using dtree
predictedDT= predict(dtree, test_dat,type=c("class"))
print(predictedDT)
print(table(predictedDT,test_dat$shares)) #Confusion Matrix
print(mean(predictedDT!=test_dat$shares)) # 0.37% is not equal

New=read.csv("resources/predict.csv",header=T)
print(predict(dtree,New, type=c("class")))


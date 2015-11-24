setwd("C:/Users/Jaini/Desktop/OnlineNewsPopularity")
dat <- read.table("resources/OnlineNewsPopularity-new-binary-shares.csv", header = TRUE, sep = ",")


library(rpart)

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
dtree
plot(dtree)
dtree$variable.importance

#Make prediction using dtree
predictedDT= predict(dtree, test_dat,type=c("matrix"))
predictedDT
table(predictedDT,test_dat$shares) #Confusion Matrix
mean(predictedDT!=test_dat$shares) # 1 ? 

New=read.csv("predict.csv",header=T)
predict(dtree,New, type=c("matrix"))


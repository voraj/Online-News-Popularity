setwd("C:/Users/Jaini/Desktop/OnlineNewsPopularity")
Dummy.data <- read.delim("C:/Users/Jaini/Desktop/OnlineNewsPopularity/Dummy data.txt")
str(Dummy.data)
library(rpart)
set.seed(245)
flags=sample(2,nrow(Dummy.data), replace = TRUE , prob = c(0.7,0.3))
trainset=Dummy.data[which(flags==1),]
testset=Dummy.data[which(flags==2),]
dtree= rpart(shares~.,data=trainset, control=rpart.control(10))
plot(dtree)
dtree$variable.importance

#install.packages("randomForest")
library(randomForest)
setwd("C:/Users/Jaini/Desktop/OnlineNewsPopularity")
#setwd("~/workspace/Online-News-Popularity/")

# Reading the database into dat
#dat <- read.table("resources/OnlineNewsPopularity-new-regular-shares.csv", header = TRUE, sep = ",")
dat <- read.table("resources/OnlineNewsPopularity-new-binary-shares.csv", header = TRUE, sep = ",")


rf=randomForest(shares~.,data=dat,mtry=4,ntree=20) # Creates the random forest
plot(rf)  #plots the random forest
class(rf)
print(rf$confusion)
print(rf$importance) #prints the importance of various attrbutes in decision making
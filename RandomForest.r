#install.packages("randomForest")
library(randomForest)
setwd("C:/Users/Jaini/Desktop/OnlineNewsPopularity")
#setwd("~/workspace/Online-News-Popularity/")

#Dummy.data <- read.delim("C:/Users/Jaini/Desktop/OnlineNewsPopularity/Dummy data.txt")
#View(Dummy.data)

# Reading the database into dat
dat <- read.table("resources/OnlineNewsPopularity-new-regular-shares.csv", header = TRUE, sep = ",")
#dat <- read.table("resources/OnlineNewsPopularity-new-binary-shares.csv", header = TRUE, sep = ",")

# If you want to divide shares into say bins of 10
# dat$group <- as.numeric(cut(dat$shares, 10))

# plotting example between weekday and shares
plot(dat$weekday, dat$shares, type = "p", 
     main = "Point plot between weekday and shares",
     xlab = "Weekday 1-Monday ... 7-Sunday",
     ylab = "Number of shares")

rf=randomForest(shares~.,data=dat,mtry=4,ntree=20)
class(rf)
print(rf$importance)
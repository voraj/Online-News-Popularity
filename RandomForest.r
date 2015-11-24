#install.packages("randomForest")
library(randomForest)
setwd("C:/Users/Jaini/Desktop/OnlineNewsPopularity")
#setwd("~/workspace/Online-News-Popularity/")

#Dummy.data <- read.delim("C:/Users/Jaini/Desktop/OnlineNewsPopularity/Dummy data.txt")
#View(Dummy.data)

# Reading the database into dat
dat <- read.table("resources/OnlineNewsPopularity-new-regular-shares.csv", header = TRUE, sep = ",")
#dat <- read.table("resources/OnlineNewsPopularity-new-binary-shares.csv", header = TRUE, sep = ",")

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

# If you want to divide shares into say bins of 10
# dat$group <- as.numeric(cut(dat$shares, 10))

# plotting example between weekday and shares
plot(dat$weekday, dat$shares, type = "p", 
     main = "Point plot between weekday and shares",
     xlab = "Weekday 1-Monday ... 7-Sunday",
     ylab = "Number of shares")

rf=randomForest(shares~.,data=dat,mtry=4,ntree=20)
#plot(rf)
class(rf)
print(rf$importance)
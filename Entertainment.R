setwd("C:/Users/Jaini/Desktop/OnlineNewsPopularity")
dat <- read.table("resources/OnlineNewsPopularity-new-binary-shares.csv", header = TRUE, sep = ",")

Bus <- dat[grep("Entertainment", dat$data_channel), ]

plot(Bus$weekday, Bus$shares, type = "p", 
     main = "Point plot between different weekday and shares for 'Entertainment' news",
     xlab = "Days of the week",
     ylab = "Popularity")

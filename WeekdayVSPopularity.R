dat <- read.table("resources/OnlineNewsPopularity-new-binary-shares.csv", header = TRUE, sep = ",")

plot(dat$weekday, dat$shares, type = "p", 
     main = "Point plot between weekdays and shares",
     xlab = "Weekday Monday ...Sunday",
     ylab = "Number of shares")

dat <- read.table("resources/OnlineNewsPopularity-new-binary-shares.csv", header = TRUE, sep = ",")

Sunday <- dat[grep("Sunday", dat$weekday), ]
print(sat$data_channel)

plot(Sunday$data_channel, Sunday$shares, type = "p", 
     main = "Point plot between different channel types and shares",
     xlab = "Types of news channel",
     ylab = "Popularity")

dat <- read.table("resources/OnlineNewsPopularity-new-binary-shares.csv", header = TRUE, sep = ",")

plot(dat$data_channel, dat$shares, type = "p", 
     main = "Plot between data channel type and shares",
     xlab = "Types of data channel",
     ylab = "Popularity")
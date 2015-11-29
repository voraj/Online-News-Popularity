##
# DatPlots.R
# 
# Script to generate data plots between different features and the label
# Part of I590 Project (Fall 2015)
#
# Authors: Jaini Vora (voraj) and Ankit Sadana (asadana)
##

# Setting working directory
#setwd("C:/Users/Jaini/Desktop/OnlineNewsPopularity")
#setwd("~/workspace/Online-News-Popularity/")

# Reading transformed dataset (with binary shares)
dat.binary <- read.table("resources/OnlineNewsPopularity-new-binary-shares.csv", header = TRUE, sep = ",")

# Weekday vs Shares
plot(dat.binary$weekday, dat.binary$shares, type = "p", 
     main = "Point plot between weekdays and shares",
     xlab = "Weekday Monday ...Sunday",
     ylab = "Number of shares")

# DataChannel vs Shares
plot(dat.binary$data_channel, dat.binary$shares, type = "p", 
     main = "Plot between data channel type and shares",
     xlab = "Types of data channel",
     ylab = "Popularity")

# Weekday vs Shares (for DataChannel: Entertainment )
Bus <- dat.binary[grep("Entertainment", dat.binary$data_channel), ]
plot(Bus$weekday, Bus$shares, type = "p", 
     main = "Point plot between different weekday and shares for 'Entertainment' news",
     xlab = "Days of the week",
     ylab = "Popularity")

# DataChannel vs Shares (for Weekday: Sunday )
Sunday <- dat.binary[grep("Sunday", dat.binary$weekday), ]
#print(Sunday$data_channel)
plot(Sunday$data_channel, Sunday$shares, type = "p", 
     main = "Point plot between different channel types and shares",
     xlab = "Types of news channel",
     ylab = "Popularity")



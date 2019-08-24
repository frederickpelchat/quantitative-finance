#Copyright © 2014 Frederick Pelchat
#
#For fun purpose only.
#
#This is a rough simulation.
#
#It assumes that:
#-The bet is on the long side.
#
#It doesnt take into account:
#-Intraday price action;
#-Sum of consecutive down days;
#-Capital fluctuation;
#-Entry/Exit strategy.
library('xts')
content <- url('http://dl.dropboxusercontent.com/s/jq18erl5n861b21/gold.daily.prices.csv?dl=1&token_hash=AAEa3HPQDxcQANILqG89Pv5dB_JelBMO1qM8HQPyqBL21A')
gold.daily.prices <- read.csv(content, sep = '', stringsAsFactors = FALSE)
idx <- as.Date(gold.daily.prices$DATE)
prices <- (as.numeric(gold.daily.prices$VALUE))
dat <- xts(prices, idx)
p2p <- lag(dat, 1)
gold.daily.prices <- merge.xts(dat, as.xts(p2p))
colnames(gold.daily.prices) <- c('curr', 'prev')
gold.daily.prices$mov <- ((gold.daily.prices$curr - gold.daily.prices$prev) / gold.daily.prices$prev) * 100
bust.all.in.50.to.1 <- gold.daily.prices[gold.daily.prices$mov <= -2.0] #-(1 / 50 * 100)
bust.all.in.500.to.1 <- gold.daily.prices[gold.daily.prices$mov <= -0.2] #-(1 / 500 * 100)
tail(bust.all.in.50.to.1, 50)
tail(bust.all.in.500.to.1, 50)

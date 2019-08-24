#Example: GOOG:NASDAQ; intraday 5 mins; last 5 days; candle chart
source('intraday-data.R')
ticker <- 'GOOG'
intra2 <- f.get.google.intraday(ticker, 60 * 5, '5d')
tail(intra2, 10)
candleChart(intra2, multi.col = TRUE, theme = 'black')

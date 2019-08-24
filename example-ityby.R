#Example: ITYBY:OTC; tick data aggregated to intraday 5 mins; last 9 days; line chart
source('intraday-data.R')
ticker <- 'ITYBY'
market <- 'OTC'
group <- rbind(
	f.get.daily.ticks(ticker, format(Sys.Date() - 8, '%Y%m%d'), market),
	f.get.daily.ticks(ticker, format(Sys.Date() - 7, '%Y%m%d'), market),
	f.get.daily.ticks(ticker, format(Sys.Date() - 6, '%Y%m%d'), market),
	f.get.daily.ticks(ticker, format(Sys.Date() - 5, '%Y%m%d'), market),
	f.get.daily.ticks(ticker, format(Sys.Date() - 4, '%Y%m%d'), market),
	f.get.daily.ticks(ticker, format(Sys.Date() - 3, '%Y%m%d'), market),
	f.get.daily.ticks(ticker, format(Sys.Date() - 2, '%Y%m%d'), market),
	f.get.daily.ticks(ticker, format(Sys.Date() - 1, '%Y%m%d'), market),
	f.get.daily.ticks(ticker, format(Sys.Date(), '%Y%m%d'), market)
)
intra <- f.aggr.5m(group)
head(intra, 10)
lineChart(intra, multi.col = TRUE, theme = 'black')

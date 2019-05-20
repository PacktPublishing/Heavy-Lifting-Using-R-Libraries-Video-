install.packages("googleVis")

library(googleVis)
#demo(googleVis)

Line4 <-  gvisLineChart(df, "country", c("val1","val2"),options=list(gvis.editor="Edit me!"))
plot(Line4)

#motionchart uses flash
M <- gvisMotionChart(Fruits, "Fruit", "Year")
plot(M)
googleVis::Fruits
str(googleVis::Fruits)



iris$time <- rep(1:50, 3)
r <- gvisMotionChart(iris, "Species", "time")
plot(r)
str(iris)

#hans rosling joy of stats on youtube a must see!
install.packages("WDI")
library(googleVis)
library(WDI)...
#First set things up..WDI stands fo World Development Indicators
inds <- c('SP.DYN.TFRT.IN','SP.DYN.LE00.IN', 'SP.POP.TOTL',
          'NY.GDP.PCAP.CD', 'SE.ADT.1524.LT.FE.ZS')
indnams <- c("fertility.rate", "life.expectancy", "population",
             "GDP.per.capita.Current.USD", "15.to.25.yr.female.literacy")
wdiData <- WDI(country="all", indicator=inds,
               start=1960, end=format(Sys.Date(), "%Y"), extra=TRUE)
colnum <- match(inds, names(wdiData))

names(wdiData)[colnum] <- indnams

## Create a motion chart
library(googleVis)
WorldBank <- droplevels(subset(wdiData, !region %in% "Aggregates"))
M <- gvisMotionChart(WorldBank,
                     idvar="country", timevar="year",
                     xvar="life.expectancy", yvar="fertility.rate",
                     sizevar="population", colorvar="region",
                     options=list(width=700, height=600),
                     chartid="WorldBank")
## Display the chart in the browser
plot(M)

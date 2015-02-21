## Set working directory
setwd("/Users/Igor/Coursera/ExploratoryAnalysis/2/")

## Read data
NEI <- readRDS("summarySCC_PM25.rds")

## How have emissions from motor vehicle sources changed from 1999–2008 
## in Baltimore City?
### DECREASED

#create a variable of motor vehicle sources in Baltimore from "ON-ROAD" NEI data
balt.veh.emit <- NEI[(NEI$fips == "24510") & (NEI$type == "ON-ROAD"),]

#aggregate dataset by emission totals per year
balt.veh.emit.by.year <- aggregate(Emissions ~ year, balt.veh.emit, sum)

#ggplot Plot5.PNG to show how emissions from motor vehicles changed in Baltimore
library(ggplot2)
png(filename = "plot5.png", width = 480, height = 480)

	ggplot(balt.veh.emit.by.year, 
		aes(x = factor(year),
			y = Emissions)) +
	geom_bar(stat = "identity") +
	ggtitle("Total On-Road Emissions per Year in Baltimore") +
	xlab("Year") +
	ylab("Aggregate On-Road Emissions")

dev.off()

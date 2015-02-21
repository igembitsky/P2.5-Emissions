## Set working directory
setwd("/Users/Igor/Coursera/ExploratoryAnalysis/2/")

## Read data
NEI <- readRDS("summarySCC_PM25.rds")

## Compare emissions from motor vehicle sources in Baltimore City with emissions 
## from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?
### LA

#create a variable of motor vehicle sources in Baltimore from "ON-ROAD" NEI data
balt.veh.emit <- NEI[(NEI$fips == "24510") & (NEI$type == "ON-ROAD"),]

#create a variable of motor vehicle sources in LA from "ON-ROAD" NEI data
la.veh.emit <- NEI[(NEI$fips == "06037") & (NEI$type == "ON-ROAD"),]

#aggregate datasets by emission totals per year
balt.veh.emit.by.year <- aggregate(Emissions ~ year, balt.veh.emit, sum)
la.veh.emit.by.year <- aggregate(Emissions ~ year, la.veh.emit, sum)

#combine the two datasets
balt.veh.emit.by.year$city <- "Baltimore"
la.veh.emit.by.year$city <- "Los Angeles"
la.balt.emit <- rbind(balt.veh.emit.by.year, la.veh.emit.by.year)

#ggplot Plot6.PNG to compare emissions from motor vehicles in Baltimore and LA
library(ggplot2)
png(filename = "plot6.png", width = 480, height = 480)

	ggplot(la.balt.emit, 
		aes(x = factor(year),
			y = Emissions),
			fill = city) +
	geom_bar(stat = "identity") +
	ggtitle("Total On-Road Emissions per Year in Baltimore/LA") +
	xlab("Year") +
	ylab("Aggregate On-Road Emissions") +
	facet_grid(. ~ city, scales = "free")

dev.off()
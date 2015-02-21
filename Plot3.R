## Set working directory
setwd("/Users/Igor/Coursera/ExploratoryAnalysis/2/")

## Read data
NEI <- readRDS("summarySCC_PM25.rds")

## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen decreases in emissions from 1999–2008 
## for Baltimore City? 
### NON-ROAD, NONPOINT, ON-ROAD
## Which have seen increases in emissions from 1999–2008?
###POINT
## Use ggplot2 to show this.

#reduce dataset to include only Baltimore
emissions.balt <- NEI[NEI$fips == "24510",]

#aggregate dataset by emission totals by type per year
emissions.balt.by.type <- aggregate(Emissions ~ year + type, emissions.balt, sum)

#baseplot Plot3.PNG to show emissions by type per year in Baltimore.
library(ggplot2)
png(filename = "plot3.png", width = 480, height = 480)

	ggplot(emissions.balt.by.type, 
		aes(x = factor(year),
			y = Emissions,
			fill = type)) +
	geom_bar(stat = "identity") +
	ggtitle("Total Emissions by Type per Year in Baltimore") +
	xlab("Year") +
	ylab("Aggregate PM2.5 Emissions") + 
	facet_grid(. ~ type)
dev.off()

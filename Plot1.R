## Set working directory
setwd("/Users/Igor/Coursera/ExploratoryAnalysis/2/")

## Read data
NEI <- readRDS("summarySCC_PM25.rds")\

## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Plot the total PM2.5 emission from all sources for 1999, 2002, 2005, and 2008.

#aggregate dataset by emission totals per year
emissionstotal <- aggregate(Emissions ~ year, NEI, sum)

#baseplot Plot1.PNG to show emissions per year.
png(filename = "plot1.png", width = 480, height = 480)

barplot(emissionstotal$Emissions,
	names.arg = emissionstotal$year, 
	xlab = "Year", 
	ylab = "Aggregate PM2.5 Emissions",
	main = "Total Emissions Per Year",
	)

dev.off()
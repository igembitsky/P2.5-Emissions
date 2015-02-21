## Set working directory
setwd("/Users/Igor/Coursera/ExploratoryAnalysis/2/")

## Read data
NEI <- readRDS("summarySCC_PM25.rds")

## Have total emissions decreased in the Baltimore (fips == "24510") from 1999 to 2008?? YES
## Plot to show this.

#reduce dataset to include only Baltimore
emissions.balt <- NEI[NEI$fips == "24510",]

#aggregate dataset by emission totals per year
emissions.balt.by.year <- aggregate(Emissions ~ year, emissions.balt, sum)

#baseplot Plot2.PNG to show emissions per year in Baltimore.
png(filename = "plot2.png", width = 480, height = 480)

barplot(emissions.balt.by.year$Emissions,
	names.arg = emissions.balt.by.year$year, 
	xlab = "Year", 
	ylab = "Aggregate PM2.5 Emissions",
	main = "Total Emissions Per Year in Baltimore",
	)

dev.off()
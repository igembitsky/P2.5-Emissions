## Set working directory
setwd("/Users/Igor/Coursera/ExploratoryAnalysis/2/")

## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Across the United States, how have emissions from 
## coal combustion-related sources changed from 1999–2008?

#create a variable with only coal-related sources
coal.sources.list <- grepl("*Coal", SCC$EI.Sector)
coal.sources <- SCC[coal.sources.list,]

#find coal.sources in NEI dataset
coal.emissions <- NEI[(NEI$SCC %in% coal.sources$SCC), ]

#aggregate dataset by emission totals by type per year
coal.emissions.by.year <- aggregate(Emissions ~ year, coal.emissions, sum)


#ggplot Plot4.PNG to show emissions of coal per year
library(ggplot2)
png(filename = "plot4.png", width = 480, height = 480)

	ggplot(coal.emissions.by.year, 
		aes(x = factor(year),
			y = Emissions)) +
	geom_bar(stat = "identity") +
	ggtitle("Total Emissions from Coal per Year") +
	xlab("Year") +
	ylab("Aggregate Emissions from Coal")

dev.off()


# Load data into NEI
NEI <- readRDS("summarySCC_PM25.rds")

# Make type as Factor
NEI$type <- as.factor(NEI$type)

# Check the average of  emissions of PM2.5 by year
plot1 <- with(NEI, tapply(Emissions, year, mean, na.rm=T))

# Draw the plot

barplot(plot1, main="Mean of Tons of PM2.5 by year", xlab="Year", ylab="Tons")

dev.copy(png,"plot1.png")
dev.off()

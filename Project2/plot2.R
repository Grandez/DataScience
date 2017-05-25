
# Load data into NEI
NEI <- readRDS("summarySCC_PM25.rds")

# Make type as Factor
NEI$type <- as.factor(NEI$type)

balt <- subset(NEI, fips == "24510")

# Check the average of  emissions of PM2.5 by year
plot2 <- with(balt, tapply(Emissions, year, mean, na.rm=T))

# Draw the plot

barplot(plot2, main="Mean of Tons of PM2.5 by year in Baltimore", xlab="Year", ylab="Tons")

dev.copy(png,"plot2.png")
dev.off()


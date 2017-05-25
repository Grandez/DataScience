
# Load data into NEI
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Motor vehicles are MObile Sources
# Get the source from SCC
scc <- SCC[SCC$SCC.Level.One == "Mobile Sources", "SCC"]

data <- subset(NEI, SCC %in% scc & fips == "24510")

# Check the average of  emissions of PM2.5 by year
plot5 <- with(data, tapply(Emissions, year, mean, na.rm=T))

# Draw the plot

barplot(plot5, main="coal combustion-related sources evolution", xlab="Year", ylab="Tons")

dev.copy(png,"plot5.png")
dev.off()


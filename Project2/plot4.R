
# Load data into NEI
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Coal can used in different levels so we need to check all levels

s1 <- grep("Coal", SCC$SCC.Level.One)
s2 <- grep("Coal", SCC$SCC.Level.Two)
s3 <- grep("Coal", SCC$SCC.Level.Three)
s4 <- grep("Coal", SCC$SCC.Level.Four)

# Create a vector with the selected SCC codes
# Note: Union use only two arguments
s12 <- union(s1,s2)
s34 <- union(s3,s4)

scc <- SCC[union(s12,s34), "SCC"]

data <- subset(NEI, SCC %in% scc)

# Check the average of  emissions of PM2.5 by year
plot4 <- with(data, tapply(Emissions, year, mean, na.rm=T))

# Draw the plot

barplot(plot4, main="coal combustion-related sources evolution", xlab="Year", ylab="Tons")

dev.copy(png,"plot4.png")
dev.off()


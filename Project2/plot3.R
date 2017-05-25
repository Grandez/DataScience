
# Load data into NEI
NEI <- readRDS("summarySCC_PM25.rds")

# Make type as Factor
NEI$type <- as.factor(NEI$type)

df <- NEI %>% 
      select(year, type, Emissions) %>%        # Select only appropiate columns
      group_by(year, type)          %>%        # Group by year and type 
      summarise(value=mean(Emissions, na.rm=T)) # Get the mean

# Remove grouping
df <- as.data.frame(df) 


# Draw the plot

ggplot(df, aes(x=year, y=log10(value), color=type), 
           main="Evolution of Tons of PM2.5", 
           xlab="Year", 
           ylab="10^x Tons") + 
       geom_line() + 
       theme_bw()

dev.copy(png,"plot3.png")
dev.off()

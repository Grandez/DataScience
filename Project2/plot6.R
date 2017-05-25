
# Load data into NEI
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Motor vehicles are MObile Sources
# Get the source from SCC
scc <- SCC[SCC$SCC.Level.One == "Mobile Sources", "SCC"]

df <- NEI %>% 
      filter(fips == "24510" | fips == "06037") %>%  # Select by fips (more restrictive than SCC)
      filter(SCC %in% scc) %>%                       # Select by SCC
      select(year, fips, Emissions) %>%        # Select only appropiate columns
      group_by(year, fips)          %>%        # Group by year and type 
      summarise(value=mean(Emissions, na.rm=T)) # Get the mean

# Draw the plot
ggplot(df, aes(x=year, y=log10(value), color=fips)) + 
       theme_bw()            +
       geom_line() +        
       ggtitle("Evolution of Tons of PM2.5") + 
       xlab("Year") + 
       ylab("10^x Tons")  

dev.copy(png,"plot6.png")
dev.off()

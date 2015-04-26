# Alan Nguyen
# Exploratory Data Analysis - Course Project #2 - Question 6
# - Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)

#  Load Data 
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SRC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

#  Create Plot Data 
VEH <- grep("vehicle",SRC$EI.Sector,value=T,ignore.case=T)
SRC.VEH <- subset(SRC, SRC$EI.Sector %in% VEH, select=SCC)
baltimore.LA <- subset(NEI, fips == "24510"|fips == "06037")
NEI.VEH <- subset(baltimore.LA, baltimore.LA$SCC %in%  SRC.VEH$SCC)
plot_data <- aggregate(NEI.VEH[c("Emissions")], list(fips = NEI.VEH$fips, year = NEI.VEH$year), sum)
plot_data$city <- rep(NA, nrow(plot_data))
plot_data[plot_data$fips == "06037", ][, "city"] <- "Los Angles County"
plot_data[plot_data$fips == "24510", ][, "city"] <- "Baltimore City"

#  Create Plot
library(ggplot2)
png('plot6.png', width=480, height=480)
p <- ggplot(plot_data, aes(x=year, y=Emissions, colour=city)) +
    geom_point(alpha=.3) +
    geom_smooth(alpha=.2, size=1, method="loess") +
    ggtitle("Vehicle Emissions in Baltimore vs. LA")

print(p)

dev.off()

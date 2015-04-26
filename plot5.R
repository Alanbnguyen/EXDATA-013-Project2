# Alan Nguyen
# Exploratory Data Analysis - Course Project #2 - Question 5
# - How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(ggplot2)

#  Load Data 
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SRC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

#  Create Data
VEH <- grep("vehicle",SRC$EI.Sector,value=T,ignore.case=T)
SRC.VEH <- subset(SRC, SRC$EI.Sector %in% VEH, select=SCC)
baltimore <- subset(NEI, fips == "24510")
NEI.VEH <- subset(baltimore, baltimore$SCC %in%  SRC.VEH$SCC)
plot_data <- aggregate(NEI.VEH[c("Emissions")], list(year = NEI.VEH$year), sum)

#  Create Plot
library(ggplot2)
png('plot5.png', width=480, height=480)
plot(plot_data$year, plot_data$Emissions, type = "l", 
     main = "Total Vehicle Emissions in Baltimore City",
     xlab = "Year", ylab = "Emissions")

dev.off()

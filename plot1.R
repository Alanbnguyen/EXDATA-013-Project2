# Alan Nguyen
# Exploratory Data Analysis - Course Project #2 - Question 1
# - Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#  Load Data 
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")

#  Create Plot Data
plot_data <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)

#  Create Plot 1

png('plot1.png', width=480, height=480)
plot(plot_data$year, plot_data$Emissions, type = "l", 
     main = "Total Emissions from PM2.5 in the US",
     xlab = "Year", ylab = "Emissions")

dev.off()
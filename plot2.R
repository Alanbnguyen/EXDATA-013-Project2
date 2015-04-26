# Alan Nguyen
# Exploratory Data Analysis - Course Project #2 - Question 2
# - Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

#  Load Data 
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")

#  Create Data
baltimore <- subset(NEI, fips == "24510")
plot_data <- aggregate(baltimore[c("Emissions")], list(year = baltimore$year), sum)

#  Create Plot
png('plot2.png', width=480, height=480)
plot(plot_data$year, plot_data$Emissions, type = "l", 
     main = "Total Emissions from PM2.5 in Baltimore City",
     xlab = "Year", ylab = "Emissions")

dev.off()
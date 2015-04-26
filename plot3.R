# Alan Nguyen
# Exploratory Data Analysis - Course Project #2 - Question 3
# - Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

#  Load Data 
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")

#  Create Data 
baltimore <- subset(NEI, fips == "24510") 
plot_data <- aggregate(baltimore[c("Emissions")], list(type = baltimore$type, year = baltimore$year), sum)

#  Create Plot
png('plot3.png', width=480, height=480)
p <- ggplot(plot_data, aes(x=year, y=Emissions, colour=type)) +
     geom_point(alpha=.3) +
     geom_smooth(alpha=.2, size=1, method="loess") +
     ggtitle("Total Emissions by Type in Baltimore City")

print(p)

dev.off()

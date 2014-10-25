setwd("E:\\documents\\Coursera\\Data Science\\Exploratory_data_analysis\\assignments\\CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#total emissions FROM motor vehicle in Baltimore City per year
total_ems_motor_bmore_perY = aggregate(Emissions ~ year, data=NEI[ NEI$fips==24510 & NEI$type =="ON-ROAD", ] , sum)

library(ggplot2)

png("plot5.png", height=480, width=480)

ggplot(total_ems_motor_bmore_perY, aes(x=factor(year), y=Emissions)) +
    geom_bar(stat="identity", fill="#631010") +
    ylab("Total PM2.5 emissions") +
    xlab("Year") +
    ggtitle("Emissions from motor vehicle in Baltimore City")

dev.off()

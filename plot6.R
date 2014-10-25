setwd("E:\\documents\\Coursera\\Data Science\\Exploratory_data_analysis\\assignments\\CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#total emissions FROM motor vehicle in Baltimore City per year
total_ems_motor_bmoreNCalf_perY = aggregate(Emissions ~ year+fips, data=NEI[ (NEI$fips=="24510" | NEI$fips=="06037")& NEI$type =="ON-ROAD", ] , sum)

library(ggplot2)
png("plot6.png", height=480, width=480)

ggplot(data=total_ems_motor_bmoreNCalf_perY, aes(x=factor(year),  y=Emissions, group=fips, colour=fips)) +
    geom_line(size=1) +
    geom_point(size=4)+
    ylab("Total PM2.5 emissions") +
    xlab("Year") +
    ggtitle("Emissions from motor vehicle in Baltimore and Los Angeles")+
    scale_colour_discrete(name="City", breaks=c("06037", "24510"), labels=c("Los Angeles County", "Baltimore City"))

dev.off()

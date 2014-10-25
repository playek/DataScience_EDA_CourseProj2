setwd("E:\\documents\\Coursera\\Data Science\\Exploratory_data_analysis\\assignments\\CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total_bmore_emS_perType_perYear <- aggregate (Emissions~type + year,  data=NEI[NEI$fips == "24510",] , sum)

library(ggplot2)
png("plot3.png", height=480, width=480)

ggplot( total_bmore_emS_perType_perYear, aes(x=factor(year),  y=Emissions, group=type, colour=type))+
geom_line(size=1) +
geom_point(size=4) +
ylab("Total PM2.5 emissions") +
xlab("Year")+
ggtitle("Total PM2.5 Emissions in Baltimore City")

dev.off()

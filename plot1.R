setwd("E:\\documents\\Coursera\\Data Science\\Exploratory_data_analysis\\assignments\\CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total_ems <- aggregate (Emissions~year,  data=NEI , sum)
png("plot1.png", height=480, width=480)

barplot(total_ems$Emissions, names.arg=total_ems$year,
        col="#445311", xlab="Year", ylab=expression('Total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions in US'))
dev.off();


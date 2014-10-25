setwd("E:\\documents\\Coursera\\Data Science\\Exploratory_data_analysis\\assignments\\CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal_scc <- SCC[grepl(".*Comb.*Coal", SCC$EI.Sector),"SCC"]
ems_coal <- NEI[(NEI$SCC %in% coal_scc), ]
total_emS_coal_perYear <- aggregate (Emissions~year,  data=ems_coal , sum)

library(ggplot2)
png("plot4.png", height=480, width=480)

qplot(as.factor(year), Emissions, data=total_emS_coal_perYear, xlab="Year", ylab=expression("Total PM"[2.5]*" Emissions"), main=expression("PM"[2.5]*"Emissions from coal combustion"), geom="bar", stat="identity")
dev.off()
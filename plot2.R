setwd("E:\\documents\\Coursera\\Data Science\\Exploratory_data_analysis\\assignments\\CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total_bmore_ems_perYear <- aggregate (Emissions~year,  data=NEI[NEI$fips == "24510",] , sum)
png("plot2.png", height=480, width=480)

barplot(height=total_bmore_ems_perYear$Emissions, names.arg=total_bmore_ems_perYear$year,
        xlab="Year", ylab=expression('Total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions in Baltimore City'), col="#555555")
dev.off();


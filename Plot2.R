## Exploratory Data Analysis Peer Graded Assignment 2##
##Plot 2##
setwd("~/CD continuing education/2017/data science/RWorkingDirectory/EDAPollutionAssgn")
library(datasets)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
#filter for Baltimore then sum emissions and group by year
SubFip<-NEI[NEI$fips=='24510',]
SumEF<-aggregate(Emissions~year,SubFip,sum)
## make barplot
barplot(SumEF$Emissions, names.arg=SumEF$year,col = "green", border = par("fg"),main = "Baltimore City Total Pollution Emissions (All Sources) \nby Year per Ton",xlab = "Year", ylab = "Tons of Pollution Emissions")
#display on file device called Plot2.png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
print("Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips 24510) from 1999 to 2008?  Yes, based on the plotted chart."
)
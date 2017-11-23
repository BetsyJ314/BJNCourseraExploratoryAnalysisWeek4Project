## Exploratory Data Analysis Peer Graded Assignment 2##
##Plot 1##
setwd("~/CD continuing education/2017/data science/RWorkingDirectory/EDAPollutionAssgn")
library(datasets)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
#sum emissions and group by year
SumE<-aggregate(Emissions ~ year, NEI, sum)
## make initial scatter plot
##with(NEI,plot(year,SumE))
## make barplot with emissions in millions of tons
barplot(SumE$Emissions/1000000, names.arg=SumE$year,col = "blue", border = par("fg"),main = "Total Pollution Emissions (All Sources) \nby Year per Million Tons",xlab = "Year", ylab = "Millions Tons of Pollution Emissions")
#display on file device called Plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
print("Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Yes, based on the plotted chart (plot1.png)."
      )
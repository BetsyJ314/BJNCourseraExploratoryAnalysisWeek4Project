## Exploratory Data Analysis Peer Graded Assignment 2##
##Plot 4##
setwd("~/CD continuing education/2017/data science/RWorkingDirectory/EDAPollutionAssgn")
library(datasets)
library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
#filter for Coal in SCC table
#unique(SCC$EI.Sector)
SCCcoal<-SCC[grep("Coal", SCC$EI.Sector), ]
#subset dataset for SCC pertaining to coal
SubSCC<-NEI[NEI$SCC %in% SCCcoal$SCC,]
SumECoal<-aggregate(Emissions~year,SubSCC,sum)
## make barplot
barplot(SumECoal$Emissions/1000000, names.arg=SumECoal$year,col = "red", border = par("fg"),main = "US Total Pollution Emissions (Coal Sources) \nby Year per Million Tons",xlab = "Year", ylab = "Million Tons of Pollution Emissions")
#display on file device called Plot4.png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
print("Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?  Yes, based on the plotted chart.")
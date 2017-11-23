## Exploratory Data Analysis Peer Graded Assignment 2##
##Plot 5##
setwd("~/CD continuing education/2017/data science/RWorkingDirectory/EDAPollutionAssgn")
library(datasets)
library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
#filter for Baltimore
SubFip<-NEI[NEI$fips=='24510',]
#unique(SCC$EI.Sector)
SCCveh<-SCC[grep("Vehicle", SCC$EI.Sector), ]
#subset dataset for SCC pertaining to vehicles
SubSCCVehicles<-SubFip[SubFip$SCC %in% SCCveh$SCC,]
SumEVeh<-aggregate(Emissions~year,SubSCCVehicles,sum)

## steps for ggplot: plot data, overlay a summary, annotation
## make quick plot
qplot(x=year,y=Emissions,data=SumEVeh,geom="line",main="Baltimore Total Pollution Emissions (Vehicle Sources) \nby Year in Tons",ylab="Emissions in Tons")

dev.copy(png, file="plot5.png", height=480, width=480)
dev.off()
print("How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? Year over year decreases can be seen in the plot.") 

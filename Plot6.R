setwd("~/CD continuing education/2017/data science/RWorkingDirectory/EDAPollutionAssgn")
library(datasets)
library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
#filter for Baltimore
SubFip<-NEI[NEI$fips=='24510',]
SubFipLA<-NEI[NEI$fips=='06037',]
#filter for vehicle emissions
#unique(SCC$EI.Sector)
SCCveh<-SCC[grep("Vehicle", SCC$EI.Sector), ]
#subset dataset for SCC pertaining to vehicles
SubFipVehB<-SubFip[SubFip$SCC %in% SCCveh$SCC,]
SubFipVehL<-SubFipLA[SubFipLA$SCC %in% SCCveh$SCC,]
#Aggregate Emissions by year for each location before row binding
SumEVehB<-aggregate(Emissions~year,SubFipVehB,sum)
#add fips back in (Didn't find a way to aggregate for 1 col but group for 2)
SumEVehB$Location<-"24510"
## aggregate LA
SumEVehL<-aggregate(Emissions~year,SubFipVehL,sum)
## add fips column
SumEVehL$Location<-"06037"
FipDataSet2<-rbind(SumEVehB,SumEVehL)





## make a plot...need a factor of the years for x axis labels
FipDataSet2$year<-factor(FipDataSet2$year, levels=c("1999","2002","2005","2008"))

ggp2<-ggplot(data=FipDataSet2,aes(x=year,y=Emissions))
##now set it up to save (g) and print ggplot object
##add layers 
g2<-ggp2+
  geom_bar(stat="identity",aes(fill=Location),position = "dodge")+
  ggtitle("Baltimore City VS LA Total Pollution Emissions (Vehicle Sources) \nby City by Year in Tons")+
  scale_fill_discrete(name="City",breaks=c("06037", "24510"),labels=c("LA", "Baltimore"))+
  ylab("Emissions in Tons")+
  geom_text(aes(label=round(Emissions,0)))
print(g2)
#display on file device called Plot6.png
dev.copy(png, file="plot6.png", height=480, width=480)
dev.off()
print("Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California. Which city has seen greater changes over time in motor vehicle emissions? In terms of absolute change between (max & min), LA has experienced greater changes than Baltimore.")
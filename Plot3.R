## Exploratory Data Analysis Peer Graded Assignment 2##
##Plot 3##
setwd("~/CD continuing education/2017/data science/RWorkingDirectory/EDAPollutionAssgn")
library(datasets)
library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
#filter for Baltimore
SubFip<-NEI[NEI$fips=='24510',]
## steps for ggplot: plot data, overlay a summary, annotation
## make quick plot without geometric object (x,y,data,facets)
##qplot(year,Emissions/1000,data=SubFip,facets = .~type)
##now view quick plot geom for regression trendline
##qplot(year,Emissions/1000,data=SubFip,facets = .~type,geom="smooth",method="lm")
##now create ggplot object with no layers
##note I need to define the years for the axis
SubFip$year<-factor(SubFip$year, levels=c("1999","2002","2005","2008"))
ggp<-ggplot(data=SubFip,aes(x=year,y=Emissions/1000))
##now set it up to save (g) and print ggplot object
##g<-ggp+geom_point()
##add facet layer, barplot layer, and title 
g<-ggp+geom_point()+facet_grid(.~type)+
  geom_bar(stat="identity",aes(fill=type))+
  ggtitle("Baltimore City Total Pollution Emissions (All Sources) \nby Type by Year in 1,000 Tons")
print(g)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
print("Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Generally decreases over time can be seen for a) Non-Road, b)NonPoint, c)On-Road types.") 
print("Which have seen increases in emissions from 1999-2008? The point type has increased in 2002 & 2005 compared to 1999.")

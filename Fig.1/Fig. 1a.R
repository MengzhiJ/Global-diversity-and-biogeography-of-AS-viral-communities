#load package
library(ggplot2)
library(ggmap)
library(sp)
library(maptools)
library(maps)

mydata <- read.delim('site.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE)

visit.x<-mydata$Longitude
visit.y<-mydata$Latitude

mapworld<-borders("world",colour = "#8E8E8E",fill="#EDEDED") 

mp1<-ggplot()+mapworld
mp2<-mp1+
  geom_point(aes(x=visit.x,y=visit.y,size=mydata$number),color="#FF8247")+
  scale_size(range=c(1,3))+ggtitle("")+
  theme(plot.title=element_text(size=25,color="gray",face="italic"))+
  theme_grey(base_size = 32)+theme(legend.position = "none") +
  theme(legend.key = element_blank())+
  theme(axis.line = element_line(color="white"))+
  theme_void()
mp2+theme(legend.text = element_text(size=13))


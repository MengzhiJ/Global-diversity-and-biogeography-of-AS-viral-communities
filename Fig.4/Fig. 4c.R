library(ggplot2)
library(reshape2)
library(dplyr)
library(readxl)

mydata<-read_excel("taxonomy.xlsx") 
mydata$Date<-as.Date(mydata$Date)
mydata<-melt(mydata,id="Date") 
mydata$variable=factor(mydata$variable, levels=c("Siphoviridae",'Myoviridae','Podoviridae','Microviridae','Inoviridae',"Others")) 

ggplot(mydata, aes(x=Date, y=value,fill=variable))+geom_bar(stat="identity",width=1.0,color="#D3D3D3")+
  scale_fill_manual(values = c('#8DD3C7', '#BEBADA', '#FB8072', '#FFFFB3', '#80B1D3','lightgray'))+
  labs(x="",y="")+
theme(panel.grid.minor = element_blank(),panel.grid.major = element_blank(),
            panel.background = element_blank())+scale_x_date(date_breaks = "1 day")

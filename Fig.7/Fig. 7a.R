library(ggplot2)
library(reshape2)
library(dplyr)
library(readxl)
mydata<-read_excel("F:/Fig.7.xlsx") 
mydata$Date<-as.Date(mydata$Date) 
mydata<-melt(mydata,id="Date") 
mydata$variable=factor(mydata$variable, levels=c('Proteobacteria-Alphaproteobacteria',"Proteobacteria-Betaproteobacteria",'Proteobacteria-Gammaproteobacteria',"Proteobacteria-Deltaproteobacteria","Other Proteobacteria" ,'Actinobacteria','Bacteroidetes',"Chloroflexi",
                                                 "Acidobacteria","Firmicutes","Planctomycetes","Nitrospirae","Candidatus Saccharibacteria","Verrucomicrobia","Candidatus Parcubacteria",
                                                 "Ignavibacteriae","Gemmatimonadetes","Euryarchaeota","Candidatus Woesebacteria","Deinococcus-Thermus","Candidatus Moranbacteria","Candidatus Cloacimonetes","Candidatus Peregrinibacteria","Candidatus Latescibacteria","Candidatus Kerfeldbacteria","Armatimonadetes","Candidatus Melainabacteria",
                                                 "Spirochaetes","Thaumarchaeota","Thermotogae","Fusobacteria","Elusimicrobia","Calditrichaeota",
                                                 "Other Archaea","Other Bacteria"))

ggplot(mydata, aes(x=Date, y=value,fill=variable))+geom_bar(stat="identity",width=1.0,color="#BEBEBE")+
  scale_fill_manual(values = c('#2570AE','#2C85CE', '#539DDA',"#8DB2F1","#BBFFFF",'#43CD80', '#9370DB', '#FFD700',
                               "#5F9EA0","#9D5D2E","#CD6839","#FFE4E1","#EEDC82","#C5B031","#E6E6FA","#FF8247","#EE5C42","#FF6A6A","#3CB371","#EEEE00","#CD9B9B","#98FB98","#B23AEE","#EE3A8C","#00FF7F","#EE8262","#BCEE68","#C1FFC1","#FFFF00","#FF83FA","#9B30FF","#C6E2FF","#FFA54F",
                               "#AC5271","gray"))+
  labs(x="",y="")+
  theme(panel.grid.minor = element_blank(),panel.grid.major = element_blank(),
        panel.background = element_blank())+scale_x_date(date_breaks = "1 day")+theme(legend.position = "right")+guides(fill = guide_legend(ncol = 1, byrow = TRUE))+
  theme(panel.grid.major=element_blank(),panel.grid.minor = element_blank(),
        legend.text = element_text(size=9))+theme(legend.title = element_blank())



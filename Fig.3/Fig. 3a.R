library(ggplot2)
library(reshape2)
library(readxl)

data<-read_excel("Alpha_diversity.xlsx")

ggplot(data, aes(x=type, y=value),color=type) + 
  geom_boxplot(aes(fill=factor(type)),outlier.alpha=0) +  
  geom_jitter(aes(x=type, y=value),color="black",size=1)+
  theme(axis.text.x=element_text(angle=30,hjust=0.2, vjust=0.5)) +
  theme(legend.position="top")+
  labs(x="",y="Shannon index",color="Type")+
  scale_fill_manual(breaks=c('Argentina (B)','America (A)','China (C)','Colombia (D)','Croatia (E)','Denmark (F)','India (G)','Korea (H)','Singapore (I)','Slovenia (J)','Sweden (K)'),
                    values=c("#99D6EA","#3C3B6E","#F40002","#FCD116","#C8102E","#8FBC8F","#EE6363","#0047A0","#AB82FF","#CDB5CD","#CD9B1D"))+
  theme_test()+  theme(panel.grid.major=element_blank(),panel.grid.minor = element_blank(),
                       axis.title.x = element_text(size=16.5),axis.title.y = element_text(size=16.5),
                       axis.text.x = element_text(angle=30,hjust =1,size=13.4,colour = 'black'),
                       axis.text.y=element_text(size=13.4,colour = 'black'),
                       panel.border = element_rect(size=1),
                       legend.text = element_text(size=13))+theme(legend.position="none")+
  theme(legend.position="none")+ylim(0,18)



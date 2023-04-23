#load package
library(vegan)
library(readxl)
library(ggplot2)

data<-read_excel("abundance.xlsx")
ggplot(data, aes(x=abundance,fill=type))+  
  geom_histogram(binwidth = 0.05,alpha=1,colour="black",size=0.25)+xlim(3,7)+
  scale_x_continuous(breaks=seq(3,6,0.5))+
  scale_fill_manual(breaks=c('Complete','High-quality','Medium-quality','Low-quality','Not-determined'),
                    values=c("#7B68EE","#008B45","#7AC5CD","#FF9D6F","#BEBEBE"))  +
  theme_test()+labs(x="",y="",fill="Genome quality")+
  ylim(0,15000)+theme(legend.position = c(0.85,0.8))+
  theme(axis.title.x = element_text(size=14),axis.title.y = element_text(size=14),
                     axis.text.x = element_text(hjust =0.5,size=11,colour = 'black'),
                      axis.text.y=element_text(size=11,colour = 'black'),
                      panel.border = element_rect(size=1),
                     legend.text = element_text(size=11),legend.title = element_blank())

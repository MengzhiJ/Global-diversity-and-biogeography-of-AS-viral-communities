#load package
library(readxl)
library(ggplot2)
library(dplyr)
library(ggpubr)
library(ggpmisc)
data<-read_excel("LDG.xlsx",col_names = T)
#LDG richness was first calculated using vegan package
ggplot(data = data, mapping = aes(x=latitude,y=Richness))+
  geom_point(size=1,color="gray")+
  labs(x="",y="")+
  theme(axis.line = element_line(color="black"))+
  geom_smooth(method = 'lm',se=F,size=0.8,fullrange=F, formula = y ~ poly(x,2),color="black")+stat_smooth(method = 'lm',se=F,size=0.8,fullrange=F, formula = y ~ x,color='blue',linetype=2)+
  theme_test()+ theme(legend.position ="none")+
  theme(panel.grid.major=element_blank(),panel.grid.minor = element_blank(),
        axis.title.x = element_text(size=12),axis.title.y = element_text(size=12),
        axis.text.x = element_text(hjust =0.5,size=12,colour = 'black'),
        axis.text.y=element_text(size=12,colour = 'black'),
        panel.border = element_rect(size=1),
        legend.text = element_text(size=11),
        legend.title = element_text(size=11))+ylim(0,1500)

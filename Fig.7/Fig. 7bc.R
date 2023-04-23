library(readxl)
library(ggpmisc)
library(ggplot2)
library(RColorBrewer)
library(ggpubr)
data<-read_excel("Fig.7.xlsx")
ggplot(data = data, mapping = aes(x=xaxis,y=yaxis,fill=Type))+
  geom_point(size = 2, alpha = 0.8,aes(shape=Type))+
  scale_fill_manual(breaks=c("Domestic sewage", "Industrial sewage","Mixed sewage"),
                    values=c("purple","#66CD00","brown"))+
  scale_color_manual(breaks=c("Domestic sewage", "Industrial sewage","Mixed sewage"),
                     values=c("purple","#66CD00","brown"))+
  scale_shape_manual(breaks=c("Domestic sewage", "Industrial sewage","Mixed sewage"),
                     values=c(21,22,24))+
  theme(panel.border = element_blank())+
  labs(x="",y="")+
  theme(axis.line = element_line(color="black"))+
  stat_smooth(aes(color = Type),method = 'lm',se=F,size=0.8,fullrange=T,formula = y ~ x)+
  theme(legend.key = element_blank())+
  theme(axis.line = element_line(color=))+
  theme_test()+ 
  theme(legend.position = 'none')+
  theme( axis.title.x = element_text(size=13),axis.title.y = element_text(size=13),
         axis.text.x = element_text(hjust =0.5,size=13,colour = 'black'),
         axis.text.y=element_text(size=13,colour = 'black'),
         panel.border = element_rect(size=1),
         legend.text = element_text(size=10.5))+ylim(0,7500)+
stat_cor(aes(color=Type,label = paste(..rr.label.., ..p.label.., sep = "~`,`~")),size=4)



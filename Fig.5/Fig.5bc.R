library(readxl)
library(ggpmisc)
library(ggplot2)
library(ggpubr)

data<-read_excel("Fig.5.xlsx",col_names = T)
ggplot(data = data, mapping = aes(x=xaxis,y=yaxis))+
  geom_point(aes(fill=Type),size = 2.8, alpha = 0.9,shape=21)+
  stat_smooth(color="black",method = 'lm',se=F,size=0.8,fullrange=T,formula = y ~ x)+   
  stat_poly_eq(aes(label = paste(..rr.label..,p.value.label,sep = "~`,`~")),
               formula = y ~ x,parse = TRUE)+
  theme(axis.line = element_line(color="black"))+
  labs(x="Relative abundance of lytic viruses (%)",y="Relative abundance of virus-associated ARGs (%)")+
  theme(legend.key = element_blank())+
  theme(axis.line = element_line(color=))+
  theme_test()+scale_fill_manual(breaks=c("Domestic wastewater", "Industrial wastewater","Mixed wastewater"),
                                  values=c("purple","#66CD00","brown"))+theme(legend.title = element_blank())+
  theme(panel.grid.major=element_blank(),panel.grid.minor = element_blank(),
       axis.title.x = element_text(size=16),axis.title.y = element_text(size=16),
        axis.text.x = element_text(size=15,colour = 'black'),
       axis.text.y=element_text(size=15,colour = 'black'),
       panel.border = element_rect(size=1),axis.ticks.x=element_blank(),
        legend.text = element_text(size=13.5))+theme(legend.position = c(0.8,0.92))


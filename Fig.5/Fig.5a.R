library(ggplot2)
library(reshape2)
library(dplyr)
library(readxl)
library(ggpubr)
data<-read_excel("Fig.5a.xlsx")

my_comparisons <- list(c("Domestic wastewater", "Industrial wastewater"), c("Mixed wastewater", "Industrial wastewater"),c("Domestic wastewater", "Mixed wastewater"))
ggplot(data, aes(x=type, y=value),color=type) + 
  geom_boxplot(aes(fill=factor(type)),
               outlier.alpha=0) +  
  geom_jitter(aes(x=type, y=value),color="black",size=0.8)+
  theme(axis.text.x=element_text(angle=0,hjust=0.2, vjust=0.5)) +
  theme(legend.position="top")+scale_fill_manual(values = c("purple","#66CD00","brown"))+
  labs(x="",y="Relative abundance of virus-associated ARGs (%)",color="Type")+
  theme_bw()+
  theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())+
  stat_compare_means(comparisons=my_comparisons, method = "t.test",label = "p.signif",bracket.size=0.5,size=4.5)+ theme_test()+ylim(0,0.008)+
  theme(panel.grid.major=element_blank(),panel.grid.minor = element_blank(),
        axis.title.x = element_text(size=15.5),axis.title.y = element_text(size=15.5),
        axis.text.x = element_text(angle=30,hjust =1,size=13,colour = 'black'),
        axis.text.y=element_text(size=13,colour = 'black'),
        panel.border = element_rect(size=1),
        legend.text = element_text(size=13))+theme(legend.position="none")

ggsave("Fig.tiff",width=4.5,height=8,path="F:/") 



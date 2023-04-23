library(ggplot2)
library(RColorBrewer)
library(ggrepel)
library(patchwork)
library(grid)
data<-read_excel("Fig.5.xlsx",col_names = T)
p1<-ggplot(data = data)+
  geom_point(aes(size=Number,fill=Relative_abundance,x=Source,y=ARGs),shape=21,colour="black",alpha=1)+
  scale_fill_gradient2(low=	"#2E8B57",mid="white",high="#6A5ACD",midpoint = 0.00006,limits=c(0,0.000175))+
  scale_size_continuous(range=c(1,13))+
  guides(size = guide_legend((title="Number")))+theme_test()+
  theme(
    legend.text=element_text(size=11.5,face="plain",color="black"),
    axis.title=element_text(size=13,face="plain",color="black"),axis.text.x = element_text(size=10,colour = 'black'),
    axis.text.y = element_text(size=11.5,face="plain",color="black"),legend.title = element_text(size=12.5,face="plain",color="black"),
    panel.border = element_rect(size=1),legend.position = "left"
    )+labs(x="",y="ARG classes")

p2<-ggplot(data=data)+geom_bar(aes(x=Relative_abundance,y=ARGs),stat="identity",width=0.75, position="dodge",fill="#6fa96f")+
  theme(panel.border = element_blank())+
  theme(axis.line = element_line(color="black")) + 
  theme_test()+theme(legend.position="none")+labs(x="",y="")+xlim(0,0.0002)+
  theme(
    legend.text=element_text(size=12,face="plain",color="black"),
    axis.title=element_text(size=12.5,face="plain",color="black"),axis.text.x = element_text(angle=30,hjust =1,size=10,colour = 'black'),
    axis.text.y = element_blank(),axis.ticks.y=element_blank(),legend.title = element_text(size=13,face="plain",color="black"),panel.border = element_rect(size=1))

p<-p1 +p2 + plot_layout(nrow= 1, widths = c(2.3, 1))





#load package
library(vegan)
library(readxl)
library(ggplot2)
#OTU table 
otu <- read.delim('OTU_table.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE) 
otu1 <-read.csv('vPCs_table.csv', row.names=1) 
otu=otu[,-dim(otu)[1]]
otu1=otu1[,-dim(otu1)[1]]
otu=t(otu)
otu1=t(otu1)

sp <- specaccum(otu,method="random")
sp1 <- specaccum(otu1,method="random")
result <- with(sp,data.frame(sites,richness,sd))
result1<-with(sp1,data.frame(sites,richness,sd))

write.table (result,file ="culmulation_otu.csv", row.names = T, col.names =T, quote =FALSE) 
write.table (result1,file ="culmulation_PCS.csv", row.names = T, col.names =T, quote =FALSE) 

all_new<-data.frame(result,result1)
ggplot(all_new)+geom_point(aes(x=sites1,y=richness1),shape=19,size=2,color="gray",alpha=0.4)+
  geom_errorbar(aes(sites,ymin=richness1-sd1,ymax=richness1+sd1),lwd=0.5,width=1,position=position_dodge(0),
                color="gray")+
geom_point(aes(x=sites,y=richness),shape=19,size=2,color="#FF8040",alpha=0.4)+
  labs(x="# of samples",y="Cumulative number")+
  geom_errorbar(aes(sites,ymin=richness-sd,ymax=richness+sd),lwd=0.5,width=1,position=position_dodge(0),
                color="#FF8040")+theme_test()+
  theme(panel.border = element_rect(size=1),axis.text.x = element_text(size=11,color = "black"),axis.text.y = element_text(size=11,color="black"),axis.title.x = element_text(size=14),axis.title.y = element_text(size=14),legend.text = element_text(size=14))+
  scale_x_continuous(limits =c(0,150),breaks = seq(0,150,20))+scale_y_continuous(limits =c(0,250000),breaks = seq(0,250000,50000))



#load packages
library(vegan)
library(SoDA)
library(ggplot2)
#data processing
#calculate bray-curtis
votu<-read.delim('OTU.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE)
distv<-vegdist(t(votu),method = 'bray')
distv_num<-1-as.numeric(distv)
distv_num<-log10(distv_num)
distv_num<-as.numeric(distv_num)
#calculate geographic distance
loca<-read.delim('latitude.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE)
xy_loca<-geoXY(loca$lng,loca$lat)
rownames(xy_loca)<-rownames(loca)
dist_loca<-vegdist(xy_loca,method = 'euclidean')
dist_loca_log<-log10(dist_loca)
dist_loca_num<-as.numeric(dist_loca_log)

data_new<-data.frame(distv_num,dist_loca_num)
write.table (data_new,file ="data_new.csv", row.names = T, col.names =T, quote =FALSE)


ggplot(data_new)+geom_point(size=1,color="grey",aes(dist_loca_num,distv_num))+
  labs(x="Log10 geographic distance (m)",y="Community taxonomic similarity")+
  geom_smooth(method="lm",color="black",aes(dist_loca_num,distv_num))+
  theme_bw()+
  theme(panel.grid.major=element_blank(),panel.grid.minor = element_blank(),
        axis.title.x = element_text(size=18),axis.title.y = element_text(size=18),
        axis.text.x = element_text(hjust =0.5,size=18,colour = 'black'),
        axis.text.y=element_text(size=18,colour = 'black'),
        axis.line = element_line(size=0.5,colour="black"),
        legend.text = element_text(size=18))+expand_limits(x=0,y=0)+
  scale_y_continuous(breaks = seq(-6,0,1))+
  scale_x_continuous(breaks = seq(0,7.5,1))+
  geom_smooth(method="lm",fill= NA,level=0,aes(dist_loca_num,distv_num))+
  theme(legend.position = 'none')+ylim(-6,0)+xlim(3.5,7.5)




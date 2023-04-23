#load package
library(vegan)
library(readxl)
library(ggplot2)
library(RColorBrewer)


otu <- read.delim('OTU.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE)
otu1 <- data.frame(t(otu))
otu2 <- log(otu1+1)
group <- read.delim('treat_country.txt', sep = '\t', stringsAsFactors = FALSE)

nmds1 <- metaMDS(otu2, distance = 'bray', k = 2)
nmds1.point <- data.frame(nmds1$point)
nmds1.species <- data.frame(nmds1$species)

sample_site <- nmds1.point[1:2]
sample_site$names <- rownames(sample_site)

names(sample_site)[1:2] <- c('NMDS1', 'NMDS2')

sample_site <- merge(sample_site, group, by = 'names', all.x = TRUE)

otu2$sum <- rowSums(otu2)
otu2 <- otu2[order(otu2$sum, decreasing = TRUE), ]
species_site <-{nmds1.species[rownames(otu2[1:10, ]), ]}[1:2]

species_site$group <- rownames(species_site)
names(species_site)[1:2] <- c('NMDS1', 'NMDS2')

ggplot(data = sample_site, mapping = aes(NMDS1, NMDS2)) + 
  geom_point(aes(color = Sewage), size = 3, alpha = 0.9) + 
  scale_shape_manual(values = c(21, 20, 19)) + 
  scale_color_manual(breaks=c('Germany','Japan','Argentina','America','China','Colombia','Croatia','Denmark','India','Korea','Singapore','Slovenia','Sweden'),
                     values=c("#2E8B57","#C1CDCD","#99D6EA","#3C3B6E","#F40002","#FCD116","#8B0000","#8FBC8F","#EE6363","#0047A0","#AB82FF","#CDB5CD","#CD9B1D")) + 
  labs(x = 'NMDS1', y = 'NMDS2') +
  theme(plot.title = element_text(hjust = 0.5)) + 
  geom_text(aes(label = group), data = species_site, color = 'black', size = 3)+ theme_test()+ 
  theme(axis.title.x = element_text(size=14.5),axis.title.y = element_text(size=14.5),
         axis.text.x = element_text(size=12,colour = 'black'),
        axis.text.y=element_text(size=12,colour = 'black'),panel.border = element_rect(size=1),
         legend.text = element_text(size=12))+theme(legend.position="none")

#anosim
otu <- read.delim('otu.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE) 
b<-t(otu)
write.table(b,"otu.txt",sep="\t",quote=F)
com = otu[,2:ncol(otu)]
m_com = as.matrix(com)
ano = anosim(m_com, otu$Tem, distance = "bray", permutations = 9999)
ano


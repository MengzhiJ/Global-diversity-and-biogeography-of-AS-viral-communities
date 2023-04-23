library(lessR)
data<-data.frame(variable=c(rep("4205 (77.65%)",4205),
                            rep("817 (15.09%)",817),
                            rep("222 (4.1%)",222),
                            rep("108 (2%)",108),
                            rep("38 (0.7%)",38),
                            rep("18 (0.33%)",18),
                            rep("6 (0.11%)",6),
                            rep("1 (0.02%)",1)))
PieChart(variable,data = data,values_size = 0.5,values="off",
         fill=c("#F9306C","#3596D2","#E70FC6","#A76D28","#8DD3C7","#5ACF54","#FFFFB3","#9F66C9"),labels_cex=1.05)

options(stringsAsFactors = F)
library(ggplot2)
a = read.table('exosomes.txt', header = T)

p <- ggplot(a,aes(x=gene,y=RPKM,fill=group))+geom_bar(stat="identity",width = .85,position = "dodge")
 p+ geom_text(aes(label=RPKM),vjust=-0.5,hjust=-0.35,position=position_dodge(1))+
   scale_fill_discrete(labels=c(expression(paste(EGFR^"+","/",BM^"+")),expression(paste(EGFR^"+","/",BM^"-")),
                                expression(paste(EGFR^"-","/",BM^"-"))))+
   geom_errorbar(aes(ymin=RPKM-se, ymax=RPKM+se),width=.1,position=position_dodge(.9))

# p+ geom_text(aes(label=RPKM),vjust=-0.5,hjust=-0.35,position=position_dodge(1),angle=90)
#angle=90，可以旋转text

#BiocManager::install("VariantAnnotation")
library(VariantAnnotation)
vcf <- readInfo("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/O771/PTSD.vcf.gz", "RS")
d <- as.data.frame(vcf)
d$Chr <- row.names(d)

d <- d[!is.na(d$vcf),]

d$rsid <- paste0("rs",d$vcf)

d <- d[,c("Chr","rsid")]
write.table(d, file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/DLPFC/RSIDs/RSID_Map.txt",quote = F,row.names = F,col.names = F)

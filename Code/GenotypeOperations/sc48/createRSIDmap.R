#BiocManager::install("VariantAnnotation")
library(VariantAnnotation)
vcf <- readInfo("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/GenotypeY1234/kleinman_single_cell_n82.maf01.vcf.gz", "RS")
d <- as.data.frame(vcf)
d$Chr <- row.names(d)

d <- d[!is.na(d$vcf),]

d$rsid <- paste0("rs",d$vcf)

d <- d[,c("Chr","rsid")]
write.table(d, file="/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Genotype/rsidMap_kleinman_single_cell_n82.maf01.txt",quote = F,row.names = F,col.names = F)

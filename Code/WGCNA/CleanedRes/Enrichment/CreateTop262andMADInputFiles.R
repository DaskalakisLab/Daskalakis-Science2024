library(bigreadr)
library(readxl)

mad_genes <- fread2("/Volumes/humgen/daskalakislab/dipietro/SciencePaper/Data/Christos/Select_gene_v1.csv")
mad_genes <- unique(mad_genes$genes)
mad_genes <- c("MAD_GENES", mad_genes)
lapply(mad_genes, write, "/Volumes/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/TOP262_and_MADGenes/MAD_GENES.txt", append=TRUE, ncolumns=1000)

top262 <- fread2("/Volumes/humgen/daskalakislab/dipietro/SciencePaper/Data/Figures/WordCloud/Top262.csv")
top262_genes <- unique(top262$`Top genes`)
top262_genes <- c("TOP262_GENES", top262_genes)
lapply(top262_genes, write, "/Volumes/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/TOP262_and_MADGenes/TOP262_GENES.txt", append=TRUE, ncolumns=1000)

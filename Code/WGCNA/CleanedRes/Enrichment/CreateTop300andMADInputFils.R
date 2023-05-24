library(bigreadr)
library(readxl)

mad_genes <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Christos/Select_gene_v1.csv")
mad_genes <- unique(mad_genes$genes)
mad_genes <- c("MAD_GENES", mad_genes)
lapply(mad_genes, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/TOP300_and_MADGenes/MAD_GENES.txt", append=TRUE, ncolumns=1000)

top300_genes <- read_xlsx("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Christos/Top300.xlsx",col_names=F)
top300_genes <- unique(top300_genes$...1)
top300_genes <- c("TOP300_GENES", top300_genes)
lapply(top300_genes, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/TOP300_and_MADGenes/TOP300_GENES.txt", append=TRUE, ncolumns=1000)

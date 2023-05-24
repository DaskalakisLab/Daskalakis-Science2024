library(bigreadr)

ptsd <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/MAGMA/PTSD3_MAGMA_GENES.txt")
ptsd_fdr <- ptsd[ptsd$FDR < 0.05,]
ptsd_fdr_genes <- unique(ptsd_fdr$Symbol)
ptsd_fdr_genes <- c("PTSD3_MAGMA_GENES", ptsd_fdr_genes)
lapply(ptsd_fdr_genes, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/MagmaPTSD/PTSD3_MAGMA_GENES.txt", append=TRUE, ncolumns=1000)

mdd <- fread2("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/MAGMA/MDDHMVP_MAGMA_GENES.txt")
mdd_fdr <- mdd[mdd$FDR < 0.05,]
mdd_fdr_genes <- unique(mdd_fdr$Symbol)
mdd_fdr_genes <- c("MDDHMVP_MAGMA_GENES", mdd_fdr_genes)
lapply(mdd_fdr_genes, write, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Enrichment/InputForEnrichment/MagmaMDD/MDDHMVP_MAGMA_GENES.txt", append=TRUE, ncolumns=1000)

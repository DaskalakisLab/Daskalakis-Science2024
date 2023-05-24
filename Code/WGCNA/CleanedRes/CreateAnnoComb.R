pheno12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
pheno3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
pheno <- plyr::rbind.fill(pheno12,pheno3)
saveRDS(pheno, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/WGCNA/CleanedRes/Annotation_Y1Y2Y3.RDS")

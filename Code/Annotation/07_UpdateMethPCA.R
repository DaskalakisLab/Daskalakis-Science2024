Annotation_Y1Y2 <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")


pca_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/PCA/Y1Y2/PCA_CentralAmyg.RDS")
pca_ca$SampleID <- rownames(pca_ca)
pca_ca <- pca_ca[,c("SampleID", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_ca) <- c(c("SampleID", "Meth_PC1", "Meth_PC2", "Meth_PC3", "Meth_PC4", "Meth_PC5"))


pca_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/PCA/Y1Y2/PCA_DG.RDS")
pca_dg$SampleID <- rownames(pca_dg)
pca_dg <- pca_dg[,c("SampleID", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_dg) <- c(c("SampleID", "Meth_PC1", "Meth_PC2", "Meth_PC3", "Meth_PC4", "Meth_PC5"))


pca_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/PCA/Y1Y2/PCA_mPFC.RDS")
pca_mpfc$SampleID <- rownames(pca_mpfc)
pca_mpfc <- pca_mpfc[,c("SampleID", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_mpfc) <- c(c("SampleID", "Meth_PC1", "Meth_PC2", "Meth_PC3", "Meth_PC4", "Meth_PC5"))

pca_meth <- rbind(pca_ca, pca_dg, pca_mpfc)
rm(pca_ca, pca_dg, pca_mpfc)
Annotation_Y1Y2 <- merge(Annotation_Y1Y2, pca_meth, by=c("SampleID"), all.x=T)

saveRDS(Annotation_Y1Y2, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")















Annotation_Y3 <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")


pca_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/PCA/Y3/PCA_CentralAmyg.RDS")
pca_ca$BrNum <- rownames(pca_ca)
pca_ca$Brain_Region <- "CentralAmyg"
pca_ca <- pca_ca[,c("BrNum", "Brain_Region", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_ca) <- c(c("BrNum", "Brain_Region", "Meth_PC1", "Meth_PC2", "Meth_PC3", "Meth_PC4", "Meth_PC5"))


pca_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/PCA/Y3/PCA_DG.RDS")
pca_dg$BrNum <- rownames(pca_dg)
pca_dg$Brain_Region <- "DG"
pca_dg <- pca_dg[,c("BrNum", "Brain_Region", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_dg) <- c(c("BrNum", "Brain_Region", "Meth_PC1", "Meth_PC2", "Meth_PC3", "Meth_PC4", "Meth_PC5"))

pca_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Methylation/PCA/Y3/PCA_mPFC.RDS")
pca_mpfc$BrNum <- rownames(pca_mpfc)
pca_mpfc$Brain_Region <- "mPFC"
pca_mpfc <- pca_mpfc[,c("BrNum", "Brain_Region", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_mpfc) <- c(c("BrNum", "Brain_Region", "Meth_PC1", "Meth_PC2", "Meth_PC3", "Meth_PC4", "Meth_PC5"))

pca_meth <- rbind(pca_ca, pca_dg, pca_mpfc)
rm(pca_ca, pca_dg, pca_mpfc)
Annotation_Y3 <- merge(Annotation_Y3, pca_meth, by=c("BrNum","Brain_Region"), all.x=T)

saveRDS(Annotation_Y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")

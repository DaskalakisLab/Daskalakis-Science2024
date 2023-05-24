Annotation_Y1Y2 <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")


pca_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/PCA/Y1Y2/PCA_CentralAmyg.RDS")
pca_ca <- pca_ca[,c("SampleID", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_ca) <- c(c("SampleID", "RNA_Gene_PC1", "RNA_Gene_PC2", "RNA_Gene_PC3", "RNA_Gene_PC4", "RNA_Gene_PC5"))


pca_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/PCA/Y1Y2/PCA_DG.RDS")
pca_dg <- pca_dg[,c("SampleID", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_dg) <- c(c("SampleID", "RNA_Gene_PC1", "RNA_Gene_PC2", "RNA_Gene_PC3", "RNA_Gene_PC4", "RNA_Gene_PC5"))


pca_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/PCA/Y1Y2/PCA_mPFC.RDS")
pca_mpfc <- pca_mpfc[,c("SampleID", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_mpfc) <- c(c("SampleID", "RNA_Gene_PC1", "RNA_Gene_PC2", "RNA_Gene_PC3", "RNA_Gene_PC4", "RNA_Gene_PC5"))

pca_rna <- rbind(pca_ca, pca_dg, pca_mpfc)
rm(pca_ca, pca_dg, pca_mpfc)
Annotation_Y1Y2 <- merge(Annotation_Y1Y2, pca_rna, by=c("SampleID"), all.x=T)

saveRDS(Annotation_Y1Y2, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")

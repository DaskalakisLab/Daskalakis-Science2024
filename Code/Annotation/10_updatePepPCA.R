Annotation_Y1Y2 <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")

#Annotation_Y1Y2 <- Annotation_Y1Y2[,names(Annotation_Y1Y2)[!(names(Annotation_Y1Y2) %in% c("PepPC1","PepPC2","PepPC3","PepPC4","PepPC5"))]]

pca_ca <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Peptide/Y1Y2/PCA_CentralAmyg.RDS")
pca_ca$BrNum <- rownames(pca_ca)
pca_ca$Brain_Region <- "CentralAmyg"
pca_ca <- pca_ca[,c("BrNum", "Brain_Region", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_ca) <- c(c("BrNum", "Brain_Region", "PepPC1", "PepPC2", "PepPC3", "PepPC4", "PepPC5"))


pca_dg <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Peptide/Y1Y2/PCA_DG.RDS")
pca_dg$BrNum <- rownames(pca_dg)
pca_dg$Brain_Region <- "DG"
pca_dg <- pca_dg[,c("BrNum", "Brain_Region", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_dg) <- c(c("BrNum", "Brain_Region", "PepPC1", "PepPC2", "PepPC3", "PepPC4", "PepPC5"))


pca_mpfc <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Peptide/Y1Y2/PCA_mPFC.RDS")
pca_mpfc$BrNum <- rownames(pca_mpfc)
pca_mpfc$Brain_Region <- "mPFC"
pca_mpfc <- pca_mpfc[,c("BrNum", "Brain_Region", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_mpfc) <- c(c("BrNum", "Brain_Region", "PepPC1", "PepPC2", "PepPC3", "PepPC4", "PepPC5"))

pca_prot <- rbind(pca_ca, pca_dg, pca_mpfc)
rm(pca_ca, pca_dg, pca_mpfc)
Annotation_Y1Y2 <- merge(Annotation_Y1Y2, pca_prot, by=c("BrNum", "Brain_Region"), all.x=T)

saveRDS(Annotation_Y1Y2, "~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
rm(list=ls())


Annotation_Y3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
#Annotation_Y3 <- Annotation_Y3[,names(Annotation_Y3)[!(names(Annotation_Y3) %in% c("PepPC1","PepPC2","PepPC3","PepPC4","PepPC5"))]]


pca_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Peptide/Y3/PCA_CentralAmyg.RDS")
pca_ca$BrNum <- rownames(pca_ca)
pca_ca$Brain_Region <- "CentralAmyg"
pca_ca <- pca_ca[,c("BrNum", "Brain_Region", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_ca) <- c(c("BrNum", "Brain_Region", "PepPC1", "PepPC2", "PepPC3", "PepPC4", "PepPC5"))


pca_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Peptide/Y3/PCA_DG.RDS")
pca_dg$BrNum <- rownames(pca_dg)
pca_dg$Brain_Region <- "DG"
pca_dg <- pca_dg[,c("BrNum", "Brain_Region", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_dg) <- c(c("BrNum", "Brain_Region", "PepPC1", "PepPC2", "PepPC3", "PepPC4", "PepPC5"))


pca_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Peptide/Y3/PCA_mPFC.RDS")
pca_mpfc$BrNum <- rownames(pca_mpfc)
pca_mpfc$Brain_Region <- "mPFC"
pca_mpfc <- pca_mpfc[,c("BrNum", "Brain_Region", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_mpfc) <- c(c("BrNum", "Brain_Region", "PepPC1", "PepPC2", "PepPC3", "PepPC4", "PepPC5"))

pca_prot <- rbind(pca_ca, pca_dg, pca_mpfc)
rm(pca_ca, pca_dg, pca_mpfc)
Annotation_Y3 <- merge(Annotation_Y3, pca_prot, by=c("BrNum", "Brain_Region"), all.y=T)
saveRDS(Annotation_Y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
#write.csv(Annotation_Y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.csv", row.names = F, quote = F)



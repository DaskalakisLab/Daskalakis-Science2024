Annotation_Y1Y2 <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")

Annotation_Y1Y2 <- Annotation_Y1Y2[,names(Annotation_Y1Y2)[!(names(Annotation_Y1Y2) %in% c("ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5"))]]

pca_ca <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Protein/Y1Y2/PCA_CentralAmyg.RDS")
pca_ca$BrNum <- rownames(pca_ca)
pca_ca$Brain_Region <- "CentralAmyg"
pca_ca <- pca_ca[,c("BrNum", "Brain_Region", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_ca) <- c(c("BrNum", "Brain_Region", "ProtPC1", "ProtPC2", "ProtPC3", "ProtPC4", "ProtPC5"))


pca_dg <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Protein/Y1Y2/PCA_DG.RDS")
pca_dg$BrNum <- rownames(pca_dg)
pca_dg$Brain_Region <- "DG"
pca_dg <- pca_dg[,c("BrNum", "Brain_Region", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_dg) <- c(c("BrNum", "Brain_Region", "ProtPC1", "ProtPC2", "ProtPC3", "ProtPC4", "ProtPC5"))


pca_mpfc <- readRDS("~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Protein/Y1Y2/PCA_mPFC.RDS")
pca_mpfc$BrNum <- rownames(pca_mpfc)
pca_mpfc$Brain_Region <- "mPFC"
pca_mpfc <- pca_mpfc[,c("BrNum", "Brain_Region", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_mpfc) <- c(c("BrNum", "Brain_Region", "ProtPC1", "ProtPC2", "ProtPC3", "ProtPC4", "ProtPC5"))

pca_prot <- rbind(pca_ca, pca_dg, pca_mpfc)
rm(pca_ca, pca_dg, pca_mpfc)
Annotation_Y1Y2 <- merge(Annotation_Y1Y2, pca_prot, by=c("BrNum", "Brain_Region"), all.x=T)

saveRDS(Annotation_Y1Y2, "~/daskalakislab/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
rm(list=ls())


Annotation_Y3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
Annotation_Y3 <- Annotation_Y3[,names(Annotation_Y3)[!(names(Annotation_Y3) %in% c("ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5"))]]


pca_ca <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Protein/Y3/PCA_CentralAmyg.RDS")
pca_ca$BrNum <- rownames(pca_ca)
pca_ca$Brain_Region <- "CentralAmyg"
pca_ca <- pca_ca[,c("BrNum", "Brain_Region", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_ca) <- c(c("BrNum", "Brain_Region", "ProtPC1", "ProtPC2", "ProtPC3", "ProtPC4", "ProtPC5"))


pca_dg <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Protein/Y3/PCA_DG.RDS")
pca_dg$BrNum <- rownames(pca_dg)
pca_dg$Brain_Region <- "DG"
pca_dg <- pca_dg[,c("BrNum", "Brain_Region", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_dg) <- c(c("BrNum", "Brain_Region", "ProtPC1", "ProtPC2", "ProtPC3", "ProtPC4", "ProtPC5"))


pca_mpfc <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Protein/PCA/Protein/Y3/PCA_mPFC.RDS")
pca_mpfc$BrNum <- rownames(pca_mpfc)
pca_mpfc$Brain_Region <- "mPFC"
pca_mpfc <- pca_mpfc[,c("BrNum", "Brain_Region", "PC1", "PC2", "PC3", "PC4", "PC5")]
names(pca_mpfc) <- c(c("BrNum", "Brain_Region", "ProtPC1", "ProtPC2", "ProtPC3", "ProtPC4", "ProtPC5"))

pca_prot <- rbind(pca_ca, pca_dg, pca_mpfc)
rm(pca_ca, pca_dg, pca_mpfc)
Annotation_Y3 <- merge(Annotation_Y3, pca_prot, by=c("BrNum", "Brain_Region"), all.y=T)
Annotation_Y3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")

update_missing <- function(Annotation_Y3, br, miss_col, full_col){
  do_not_dup <- c("SampleID","Brain_Region","RIN","numReads","numMapped","numUnmapped","overallMapRate",
                  "concordMapRate","totalMapped","mitoMapped","mitoRate","totalAssignedGene",
                  "rRNA_rate","per_base_sequence_quality","per_tile_sequence_quality",
                  "per_base_sequence_content","per_sequence_gc_content","per_base_n_content",
                  "sequence_length_distribution","sequence_duplication_levels","overrepresented_sequences",
                  "adapter_content","Astro","Endo","ex","in","Micro","Mural","Oligo","OPC","Tcell","Macrophage",
                  "ProtPC1","ProtPC2","ProtPC3","ProtPC4","ProtPC5")
  cols <- names(Annotation_Y3)
  cols <- cols[!(cols %in% do_not_dup)]
  for (col in cols){
    Annotation_Y3[(Annotation_Y3$BrNum==br) & (Annotation_Y3$Brain_Region==miss_col), col] <- Annotation_Y3[(Annotation_Y3$BrNum==br) & (Annotation_Y3$Brain_Region==full_col), col]
  }
  return(Annotation_Y3)
}
Annotation_Y3 <- update_missing(Annotation_Y3, br="Br2702", miss_col="CentralAmyg", full_col="DG")
Annotation_Y3 <- update_missing(Annotation_Y3, br="Br5432", miss_col="mPFC", full_col="DG")
Annotation_Y3 <- update_missing(Annotation_Y3, br="Br6206", miss_col="mPFC", full_col="DG")
Annotation_Y3 <- update_missing(Annotation_Y3, br="Br6458", miss_col="CentralAmyg", full_col="DG")
Annotation_Y3 <- update_missing(Annotation_Y3, br="Br8183", miss_col="DG", full_col="mPFC")

saveRDS(Annotation_Y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")
#write.csv(Annotation_Y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.csv", row.names = F, quote = F)



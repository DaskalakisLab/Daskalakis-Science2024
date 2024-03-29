
#R version: R4.1.2


# Remove the current 'rlang' package
#remove.packages("rlang")

# Install the latest version of 'rlang' from CRAN
#install.packages("rlang")

# Remove the current 'dplyr' package
#remove.packages("dplyr")

# Install the latest version of 'dplyr' from CRAN
#install.packages("dplyr")

library(SummarizedExperiment)
library(edgeR)
library(dplyr)

create_dge_list <- function(counts, anno){
  dge <- DGEList(counts)
  dge$samples$SampleID <- rownames(dge$samples)
  dge$samples <- merge(dge$samples, anno[,c("SampleID", "Dx")], by="SampleID", all.x=T)
  dge$samples$group <- dge$samples$Dx
  rownames(dge$samples) <- dge$samples$SampleID
  dge$samples <- dge$samples[,c("group", "lib.size", "norm.factors")]
  dge$group <- as.factor(dge$samples$group)
  dge$samples <- dge$samples[colnames(dge$counts),]
  return(dge)
}


annoy123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Annotation/Annotation_Y123_updatedPCs.RDS")


count_ca_y123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Counts/Jx/Y1Y2Y3/Count_CentralAmyg.RDS")
count_ca_y123 <- count_ca_y123 %>% replace(is.na(.), 0)
dge_ca_y123 <- create_dge_list(count_ca_y123, annoy123)
identical(colnames(dge_ca_y123$counts), rownames(dge_ca_y123$samples))
saveRDS(dge_ca_y123, "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Counts/Jx/Y1Y2Y3/DGE_CentralAmyg.RDS")
rm(count_ca_y123,dge_ca_y123)
gc()

count_dg_y123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Counts/Jx/Y1Y2Y3/Count_DG.RDS")
count_dg_y123 <- count_dg_y123 %>% replace(is.na(.), 0)
dge_dg_y123 <- create_dge_list(count_dg_y123, annoy123)
identical(colnames(dge_dg_y123$counts), rownames(dge_dg_y123$samples))
saveRDS(dge_dg_y123, "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Counts/Jx/Y1Y2Y3/DGE_DG.RDS")
rm(count_dg_y123,dge_dg_y123)
gc()

count_mpfc_y123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Counts/Jx/Y1Y2Y3/Count_mPFC.RDS")
count_mpfc_y123 <- count_mpfc_y123 %>% replace(is.na(.), 0)
dge_mpfc_y123 <- create_dge_list(count_mpfc_y123, annoy123)
identical(colnames(dge_mpfc_y123$counts), rownames(dge_mpfc_y123$samples))
saveRDS(dge_mpfc_y123, "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Counts/Jx/Y1Y2Y3/DGE_mPFC.RDS")
rm(count_mpfc_y123,dge_mpfc_y123)
gc()







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
annoy12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y1Y2.RDS")
annoy3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/Annotation/Annotation_Y3.RDS")

count_ca_y12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y1Y2/Count_CentralAmyg.RDS")
count_ca_y12 <- count_ca_y12 %>% replace(is.na(.), 0)
dge_ca_y12 <- create_dge_list(count_ca_y12, annoy12)
identical(colnames(dge_ca_y12$counts), rownames(dge_ca_y12$samples))
saveRDS(dge_ca_y12, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y1Y2/DGE_CentralAmyg.RDS")
rm(count_ca_y12,dge_ca_y12)
gc()

count_dg_y12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y1Y2/Count_DG.RDS")
count_dg_y12 <- count_dg_y12 %>% replace(is.na(.), 0)
dge_dg_y12 <- create_dge_list(count_dg_y12, annoy12)
identical(colnames(dge_dg_y12$counts), rownames(dge_dg_y12$samples))
saveRDS(dge_dg_y12, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y1Y2/DGE_DG.RDS")
rm(count_dg_y12,dge_dg_y12)
gc()

count_mpfc_y12 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y1Y2/Count_mPFC.RDS")
count_mpfc_y12 <- count_mpfc_y12 %>% replace(is.na(.), 0)
dge_mpfc_y12 <- create_dge_list(count_mpfc_y12, annoy12)
identical(colnames(dge_mpfc_y12$counts), rownames(dge_mpfc_y12$samples))
saveRDS(dge_mpfc_y12, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y1Y2/DGE_mPFC.RDS")
rm(count_mpfc_y12,dge_mpfc_y12)
gc()






count_ca_y3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y3/Count_CentralAmyg.RDS")
count_ca_y3 <- count_ca_y3 %>% replace(is.na(.), 0)
dge_ca_y3 <- create_dge_list(count_ca_y3, annoy3)
identical(colnames(dge_ca_y3$counts), rownames(dge_ca_y3$samples))
saveRDS(dge_ca_y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y3/DGE_CentralAmyg.RDS")
rm(count_ca_y3,dge_ca_y3)
gc()

count_dg_y3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y3/Count_DG.RDS")
count_dg_y3 <- count_dg_y3 %>% replace(is.na(.), 0)
dge_dg_y3 <- create_dge_list(count_dg_y3, annoy3)
identical(colnames(dge_dg_y3$counts), rownames(dge_dg_y3$samples))
saveRDS(dge_dg_y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y3/DGE_DG.RDS")
rm(count_dg_y3,dge_dg_y3)
gc()

count_mpfc_y3 <- readRDS("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y3/Count_mPFC.RDS")
count_mpfc_y3 <- count_mpfc_y3 %>% replace(is.na(.), 0)
dge_mpfc_y3 <- create_dge_list(count_mpfc_y3, annoy3)
identical(colnames(dge_mpfc_y3$counts), rownames(dge_mpfc_y3$samples))
saveRDS(dge_mpfc_y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y3/DGE_mPFC.RDS")
rm(count_mpfc_y3,dge_mpfc_y3)
gc()

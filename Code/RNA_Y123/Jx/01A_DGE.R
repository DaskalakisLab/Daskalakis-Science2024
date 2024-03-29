library(SummarizedExperiment)
library(edgeR)
#library(dplyr)

# Load data file
load("/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Bulk/rse_jx.y123_n688.Rdata")

dcount=assays(rse_jx)[[1]]
rm(rse_jx)
gc()

dcount <- as.data.frame(dcount)
#dcount[is.na(dcount)] <- 0

annoy123 <- readRDS("/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/Annotation/Annotation_Y123_updatedPCs.RDS")



ca_y123 <- unique(annoy123[annoy123$Brain_Region=="CentralAmyg", "SampleID"])
ca_y123 <- na.omit(ca_y123)
dg_y123 <- unique(annoy123[annoy123$Brain_Region=="DG", "SampleID"])
dg_y123 <- na.omit(dg_y123)
mpfc_y123 <- unique(annoy123[annoy123$Brain_Region=="mPFC", "SampleID"])
mpfc_y123  <- na.omit(mpfc_y123 )

count_ca_y123 <- dcount[,ca_y123]
count_dg_y123 <- dcount[,dg_y123]
count_mpfc_y123 <- dcount[,mpfc_y123]



saveRDS(count_ca_y123, "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Counts/Jx/Y1Y2Y3/Count_CentralAmyg.RDS")
saveRDS(count_dg_y123, "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Counts/Jx/Y1Y2Y3/Count_DG.RDS")
saveRDS(count_mpfc_y123 , "/data/humgen/daskalakislab/SciencePaper_Mo_Ioulia/Data/RNA/Counts/Jx/Y1Y2Y3/Count_mPFC.RDS")


rm(dcount)

# create_dge_list <- function(counts, anno){
#   dge <- DGEList(counts)
#   dge$samples$SampleID <- rownames(dge$samples)
#   dge$samples <- merge(dge$samples, anno[,c("SampleID", "Dx")], by="SampleID", all.x=T)
#   dge$samples$group <- dge$samples$Dx
#   rownames(dge$samples) <- dge$samples$SampleID
#   dge$samples <- dge$samples[,c("group", "lib.size", "norm.factors")]
#   dge$group <- as.factor(dge$samples$group)
#   dge$samples <- dge$samples[colnames(dge$counts),]
#   return(dge)
# }
# 
# dge_ca_y12 <- create_dge_list(count_ca_y12, annoy12)
# dge_dg_y12 <- create_dge_list(count_dg_y12, annoy12)
# dge_mpfc_y12 <- create_dge_list(count_mpfc_y12, annoy12)
# 
# dge_ca_y3 <- create_dge_list(count_ca_y3, annoy3)
# dge_dg_y3 <- create_dge_list(count_dg_y3, annoy3)
# dge_mpfc_y3 <- create_dge_list(count_mpfc_y3, annoy3)
# 
# identical(colnames(dge_ca_y12$counts), rownames(dge_ca_y12$samples))
# identical(colnames(dge_dg_y12$counts), rownames(dge_dg_y12$samples))
# identical(colnames(dge_mpfc_y12$counts), rownames(dge_mpfc_y12$samples))
# 
# identical(colnames(dge_ca_y3$counts), rownames(dge_ca_y3$samples))
# identical(colnames(dge_dg_y3$counts), rownames(dge_dg_y3$samples))
# identical(colnames(dge_mpfc_y3$counts), rownames(dge_mpfc_y3$samples))
# 
# 
# setdiff(rownames(dge_ca_y12$samples), ca_y12)
# setdiff(rownames(dge_dg_y12$samples), dg_y12)
# setdiff(rownames(dge_mpfc_y12$samples), mpfc_y12)
# 
# setdiff(rownames(dge_ca_y3$samples), ca_y3)
# setdiff(rownames(dge_dg_y3$samples), dg_y3)
# setdiff(rownames(dge_mpfc_y3$samples), mpfc_y3)
# 
# 
# saveRDS(dge_ca_y12, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y1Y2/DGE_CentralAmyg.RDS")
# saveRDS(dge_dg_y12, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y1Y2/DGE_DG.RDS")
# saveRDS(dge_mpfc_y12, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y1Y2/DGE_mPFC.RDS")
# 
# saveRDS(dge_ca_y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y3/DGE_CentralAmyg.RDS")
# saveRDS(dge_dg_y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y3/DGE_DG.RDS")
# saveRDS(dge_mpfc_y3, "/data/humgen/daskalakislab/dipietro/SciencePaper/Data/RNA/Counts/Jx/Y3/DGE_mPFC.RDS")
# 
